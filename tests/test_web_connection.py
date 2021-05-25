def test_web_checks(host):
    assert host.socket("tcp://0.0.0.0:80").is_listening
