class scout ($display_name=$hostname, $user='scout', $key) {

  package {['scout', 'SystemTimer', 'elif', 'request-log-analyzer']:
      ensure   => 'installed',
      provider => 'gem';
  }

  if $display_name {
    $option_displayname = "--name='${display_name}'"
  }

  cron {
    'scout':
      command   => "/usr/bin/scout ${option_displayname} ${key}",
      user	    => $user,
      require   => Package['scout'],
  }

}