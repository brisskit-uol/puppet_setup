class pound {
file { "junk":
    path    => "/home/ob30/puppet/test.conf",
    owner   => root,
    group   => root,
    mode    => 644,
    content => template("pound/vapp.erb"),
  }
}
