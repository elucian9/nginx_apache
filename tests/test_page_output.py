def test_getting_urls(host):
    http_command = host.run("curl http://localhost:8080")
    assert http_command.rc == 0

def test_nginx_checks(host):
    output = host.check_output('curl http://localhost:8080')
    assert 'Hello from server' in output
