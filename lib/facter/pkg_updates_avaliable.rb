Facter.add(:pkg_updates_available) do
  confine :osfamily => %w{Debian RedHat Solaris}
  confine :operatingsystemrelease => '5.11' if Facter.value(:osfamily) == 'Solaris'
  pkg_updates_fact = Facter.value(:pkg_updates)
  setcode do
    if pkg_updates_fact.nil?
      false
    else
      true
    end
  end
end
