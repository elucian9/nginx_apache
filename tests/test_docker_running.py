def test_is_docker_service_running(host):
    docker_service = host.service('docker')

    assert docker_service.is_running
    assert docker_service.is_enabled
