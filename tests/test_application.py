import importlib
import os
import sys
from unittest.mock import Mock, patch

# Ensure the repository root is on the Python path
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), "..")))

import pytest

# Fixture to provide a Flask test client with mocked AWS clients
@pytest.fixture
def client():
    with patch('boto3.client') as boto_client:
        mock_sns = Mock()
        mock_ssm = Mock()

        def client_factory(service_name, region_name=None):
            if service_name == 'sns':
                return mock_sns
            elif service_name == 'ssm':
                return mock_ssm
            raise ValueError(service_name)

        boto_client.side_effect = client_factory
        mock_ssm.get_parameter.return_value = {'Parameter': {'Value': 'dummy-arn'}}

        import app.application as application
        importlib.reload(application)
        with patch.object(application, 'render_template', return_value='OK'):
            application.app.config['TESTING'] = True
            yield application.app.test_client(), mock_sns


def test_index_returns_200(client):
    test_client, _ = client
    response = test_client.get('/')
    assert response.status_code == 200


def test_send_sms_redirects(client):
    test_client, mock_sns = client
    response = test_client.post('/send_sms', data={'message': 'hello'})
    assert response.status_code == 302
    mock_sns.publish.assert_called_once()
