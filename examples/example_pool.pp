unity_system { 'FNM00150600267':
  ip       => '10.245.101.35',
  user     => 'admin',
  password => 'Password123!',
}

unity_pool { 'Beijing':
  unity_system => Unity_system['FNM00150600267'],
  description => 'Test that the pool is already created',
  raid_groups => [{
    disk_group => 'dg_15',
    raid_type => 1,
    stripe_width => 0,
    disk_num => 5,
  }]
}


unity_pool { 'puppet_pool':
  unity_system => Unity_system['FNM00150600267'],
  description => 'created by puppet module',
  raid_groups => [{
    disk_group => 'dg_15',
    raid_type => 1,
    stripe_width => 0,
    disk_num => 5,
  }]
}

