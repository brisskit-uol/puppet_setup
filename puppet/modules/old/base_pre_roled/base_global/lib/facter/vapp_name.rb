Facter.add(:vapp_name) do
        setcode do
                fqdn = Facter.value(:fqdn)
                fqdn.split(/[-.]/).at(0)
        end
end
