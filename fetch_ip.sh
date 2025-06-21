#!/bin/bash
# Utility to display IP Addresses

print_default_addresses()
{
        # Fetch default gateway device
        # my_default_dev=$(ip route | grep -P "^default" | perl -p -e '@out = split /dev/,$_; print $out[1]' | cut -d' ' -f2 | head -n 1)

        # Fetch all associated addresses
        ip_listing=$(hostname -I)

        # Filter them by dotted-decimal/hexquad representation
        v4_address=$(echo $ip_listing | tr ' ' '\n' | grep "\.")
        v6_address=$(echo $ip_listing | tr ' ' '\n' | grep "\:")

        # Display them
        if [[ $v4_address ]]; then
                echo "$(echo $v4_address | tr ' ' '\n' | sort | uniq | perl -pe 's/^/🌐 IPv4 Address: /')"
        fi

        if [[ $v6_address ]]; then
                echo "$(echo $v6_address | tr ' ' '\n' | sort | uniq | perl -pe 's/^/🌐 IPv6 Address: /')"
        fi

        # Fallback if none found
        if [[ ! $v4_address && ! $v6_address ]]; then
                echo "🌐❌ IP Addresses Unavailable"
        fi
}
