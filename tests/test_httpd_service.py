def test_httpd_running(host):
    assert host.service("httpd").is_running is True
