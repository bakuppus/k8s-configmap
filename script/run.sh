touch /tmp/myfile
vault secrets tune -max-lease-ttl=87600h pki
vault write -field=certificate pki/root/generate/internal  common_name="example.com" ttl=87600h > CA_cert.crt
vault write pki/config/urls issuing_certificates="http://127.0.0.1:8200/v1/pki/ca" crl_distribution_points="http://127.0.0.1:8200/v1/pki/crl"
