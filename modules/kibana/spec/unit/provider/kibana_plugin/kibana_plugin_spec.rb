require 'spec_helper'
require 'helpers/unit/provider/kibana_plugin_shared_examples'

describe Puppet::Type.type(:kibana_plugin).provider(:kibana_plugin) do
  let(:executable)   { home_path + '/bin/kibana-plugin' }
  let(:home_path)    { '/usr/share/kibana' }
  let(:install_args) { ['install'] }
  let(:plugin_path)  { home_path + '/plugins' }
  let(:provider)     { described_class.new(:name => plugin_one[:name]) }
  let(:remove_args)  { ['remove'] }

  let(:plugin_one) do
    {
      :name => 'x-pack',
      :version => '5.2.1'
    }
  end

  let(:plugin_two) do
    {
      :name => 'logtrail',
      :version => '5.2.0'
    }
  end

  let(:resource) do
    Puppet::Type.type(:kibana_plugin).new(
      :name     => plugin_one[:name],
      :provider => provider,
      :version  => plugin_one[:version]
    )
  end

  include_examples 'kibana plugin provider'
end
