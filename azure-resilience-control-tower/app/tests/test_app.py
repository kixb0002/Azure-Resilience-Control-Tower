from src.main import create_app


def test_index_returns_application_metadata():
    client = create_app().test_client()

    response = client.get("/")

    assert response.status_code == 200
    assert response.get_json()["application"] == "azure-resilience-control-tower"


def test_health_endpoint_reports_healthy():
    client = create_app().test_client()

    response = client.get("/health")

    assert response.status_code == 200
    assert response.get_json() == {"status": "healthy"}
