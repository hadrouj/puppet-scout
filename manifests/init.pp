class scout ($user='scout', $key) {

  package {['scout', 'SystemTimer', 'elif', 'request-log-analyzer']:
      ensure   => 'installed',
      provider => 'gem';
  }

  cron {
    'scout':
      command   => "/usr/bin/scout ${key}",
      user	    => $user,
      require   => Package['scout'],
  }

}