#!/usr/bin/env bash
# A script for my client SSH configuration file to
# connect to a server without typing a password

file_line { 'Turn off passwd auth':
  path   => '/etc/ssh/ssh_config',
  line   => 'PasswordAuthentication no',
  match  => '^#?PasswordAuthentication',
}

file_line { 'Declare identity file':
  path   => '/etc/ssh/ssh_config',
  line   => 'IdentityFile ~/.ssh/school',
  match  => '^#?IdentityFile',
}

service { 'ssh':
  ensure     => 'running',
  enable     => true,
  subscribe  => File_line['Turn off passwd auth', 'Declare identity file'],
}