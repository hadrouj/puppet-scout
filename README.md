Puppet-Scout
============

Puppet module to install Scout monitoring agent.

Usage
-----
class { 'scout':
  user      => 'ec2-user',
  key       => 'your key here',
}

This will install Scout agent and its requirements as gems, then adds a cron to be run each minute.
Parameters:
  user: system user that will run the agent cron
  key: your agent key
