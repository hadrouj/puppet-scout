class scout ($display_name=$hostname, $roles_list='', $user='scout', $key) {

  package {['scout', 'SystemTimer', 'elif', 'request-log-analyzer']:
      ensure   => 'installed',
      provider => 'gem';
  }

  if $display_name {
    $option_displayname = "--name='${display_name}'"
  }

  if $roles_list != '' {
    $option_roles = "--roles ${roles_list}"
  }

  cron {
    'scout':
      command   => "/usr/bin/scout ${option_displayname} ${option_roles} ${key}",
      user	    => $user,
      require   => Package['scout'],
  }

}