import pytest
import sys
import os

from backend.sample_app import sample

sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), 'backend')))

@pytest.fixture
def client():
    sample.config['TESTING'] = True
    with sample.test_client() as client:
        yield client

def test_home_status_code(client):
    response = client.get('/')
    assert response.status_code == 200

def test_ejemplo_basico():
    assert 1 + 1 == 2 

def test_ejemplo_fallido():
    assert 1 + 1 == 3

