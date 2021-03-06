#!/usr/bin/ruby -w

# Copyright (c) 2017 Dell Inc. or its subsidiaries.
# All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may
# not use this file except in compliance with the License. You may obtain
# a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations
# under the License.

Puppet::Type.newtype(:unity_io_limit_policy) do
  @doc = 'Configure DellEMC Unity io limit policy.'
  ensurable

  newparam(:name, :namevar => true) do
    desc 'I/O limit rule name.'
  end

  newproperty(:policy_type) do
    desc 'Indicates whether the I/O limit policy is absolute or density-based.'
  end
  newproperty(:description) do
    desc 'I/O limit rule description.'

  end

  newproperty(:max_iops) do
    desc 'Read/write IOPS limit.'
  end

  newproperty(:max_kbps) do
    desc 'Read/write KB/s limit.'
  end

  newproperty(:max_iops_density) do
    desc 'Read/write density-based IOPS limit.'
  end

  newproperty(:max_kbps_density) do
    desc 'Read/write density-based KB/s limit.'
  end

  newproperty(:burst_rate) do
    desc 'The percentage of read/write IOPS and/or KBPS over the limits a storage object is allowed to process during a spike in demand.'

    validate do |value|
      if value.is_a? Integer
        if value >= 0 && value <= 100
          true
        else
          raise(Puppet::Error, 'burst_rate must be 0 to 100.')
        end
      else
        raise(Puppet::Error, 'burst_rate must be integer.')
      end
    end
  end

  newproperty(:burst_time) do
    desc 'How long a storage object is allowed to process burst traffic.'
    validate do |value|
      if value.is_a? Integer
        if value >= 1 && value <= 60
          true
        else
          raise(Puppet::Error, 'burst_time must be 1 to 60.')
        end
      else
        raise(Puppet::Error, 'burst_time must be integer.')
      end
    end
  end

  newproperty(:burst_frequency) do
    desc 'How often a storage object is allowed to process burst traffic for the duration of burst time.'
    validate do |value|
      if value.is_a? Integer
        if value >= 1 && value <= 24
          true
        else
          raise(Puppet::Error, 'burst_frequency must be 1 to 24.')
        end
      else
        raise(Puppet::Error, 'burst_frequency must be integer.')
      end
    end
  end
end
