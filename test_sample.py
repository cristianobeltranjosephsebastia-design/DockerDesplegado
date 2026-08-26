import pytest
import sys
import os

sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), 'backend')))

from sample_app import sample

def test_ejemplo_basico():
    assert 1 + 1 == 2  # nosec B101
    
@pytest.fixture
def client():
    sample.config['TESTING'] = True
    with sample.test_client() as client:
        yield client

def test_home_status_code(client):
    response = client.get('/')
    assert response.status_code == 200 # nosec B101


