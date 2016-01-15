# ensure cloudopting.conf file exists
file { '/fluentd/etc/cloudopting.conf':
  ensure => file,
  content => '# For reference: https://github.com/fluent/fluentd-docker-image

<source>
  type forward
  port 24223
  bind fluentd-forwarding
</source>

<match **>
  type secure_forward
# Shared_key, the same that fluentd in CloudOpting machine
  shared_key password
  self_hostname ${hostname}
  secure true
# Replace ca_cert.pem with the name of your certificate
  ca_cert_path /fluentd/certs/ca_cert.pem

  <server>
    name fluentd
    host coco
    port 24224
    weight 60
  </server>
</match>',    # fluentd-forwarding config
} 