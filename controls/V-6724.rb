APACHE_CONF_FILE = attribute(
  'apache_conf_file',
  description: 'define path for the apache configuration file',
  default: "/etc/httpd/conf/httpd.conf"
)

control "V-6724" do
  title "Web server and/or operating system information must be protected.

"
  desc  "The web server response header of an HTTP response can contain several
fields of information including the requested HTML page. The information
included in this response can be web server type and version, operating system
and version, and ports associated with the web server. This provides the
malicious user valuable information without the use of extensive tools."
  impact 0.3
  tag "gtitle": "WG520"
  tag "gid": "V-6724"
  tag "rid": "SV-36672r1_rule"
  tag "stig_id": "WG520 A22"
  tag "fix_id": "F-26581r1_fix"
  tag "cci": []
  tag "nist": ["Rev_4"]
  tag "documentable": false
  tag "responsibility": "System Administrator"
  tag "check": "Enter the following command:

grep \"ServerTokens\" /usr/local/apache2/conf/httpd.conf

The directive ServerTokens must be set to “Prod” (ex. ServerTokens Prod).  This
directive controls whether Server response header field that is sent back to
clients that includes a description of the OS-type of the server as well as
information about compiled-in modules.

If the web server or operating system information are sent to the client via
the server response header or the directive does not exist, this is a finding.

Note: The default value is set to Full."
  tag "fix": "Edit the /usr/local/apache2/conf/httpd.conf file and ensure the
directive is set to Prod.

"

  describe apache_conf(APACHE_CONF_FILE) do
    its('ServerTokens') { should cmp 'Prod' }
  end
end
