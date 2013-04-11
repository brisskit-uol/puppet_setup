Facter.add(:vm_role) do
        setcode do
                fqdn = Facter.value(:fqdn)
                fqdn.split(/[-.]/).at(1)
        end
end
