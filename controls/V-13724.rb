APACHE_CONF_FILE = attribute(
  'apache_conf_file',
  description: 'define path for the apache configuration file',
  default: "/etc/httpd/conf/httpd.conf"
)

control "V-13724" do
  title "The Timeout directive must be properly set."
  desc  "The Timeout requirements are set to mitigate the effects of several
types of denial of service attacks. Although there is some latitude concerning
the settings themselves, the requirements attempt to provide reasonable limits
for the protection of the web server. If necessary, these limits can be
adjusted to accommodate the operational requirement of a given system."
  impact 0.5
  tag "gtitle": "WA000-WWA020"
  tag "gid": "V-13724"
  tag "rid": "SV-32977r1_rule"
  tag "stig_id": "WA000-WWA020 A22"
  tag "fix_id": "F-13172r1_fix"
  tag "cci": []
  tag "nist": ["Rev_4"]
  tag "documentable": false
  tag "responsibility": "Web Administrator"
  tag "check": "To view the Timeout value enter the following command:

grep \"Timeout\" /usr/local/apache2/conf/httpd.conf.

Verify the value is 300 or less if not, this is a finding.

Note:If the directive does not exist, this is not a finding because it will
default to 300.  It is recommended that the directive be explicitly set to
prevent unexpected results should the defaults for any reason be changed (i.e.
software update).
"
  tag "fix": "Edit the httpd.conf file and set the value of \"Timeout\" to 300
seconds or less."

  describe apache_conf(APACHE_CONF_FILE) do
    its('Timeout') { should cmp '300' }
  end
end
