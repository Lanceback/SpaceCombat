hp=10
avoid=0
shield_hp=0

dmg=0
atk=0

plasma_cd=0
overheat_cd=0
shield_cd=0
heal_cd=0
plasma_charge=0

winState=0

isHost=0

echo "*-------------------------------------*"
echo "Welcome!"
echo ""
echo "1: Host Game"
echo "2: Join Game"
echo "*-------------------------------------*"
read choice
if [ $choice -eq 1 ]; then
	echo "Hosting Game"
	isHost=1
	# find stock alternative to nc if possible
elif [ $choice -eq 2 ]; then
	isHost=0
	echo "IP address of Oponent:"
	read enemy_ip

	# exec 3<>/dev/tcp/127.0.0.1/4444
	exec 3<>/dev/tcp/$enemy_ip/4444
fi

while [ $winState -eq 0 ]
do
	dmg=0
	plasma_cd=$((plasma_cd-1))
	overheat_cd=$((overheat_cd-1))
	shield_cd=$((shield_cd-1))
	heal_cd=$((heal_cd-1))
	avoid=$((avoid-1))

	if [ $heal_cd -gt 2 && hp -lt 8 ]; then
		echo "Nanobot swarms are repairing your ship."
		hp=$(($hp+1))
	elif [ $heal_cd -gt 2 && hp -lt 9 ]; then
		echo "Nanobot swarms have completely reconstructed ship!"
		hp=$(($hp+1))
	fi
	if [ $avoid -gt 0 ]; then
		echo "Attempting to evade enemy fire!"
	fi
	if [ $plasma_charge -eq 1 ]; then
		echo "Plasma Cannon charged up and firing!"
		plasma_charge=0
		dmg=$((dmg+4))
	fi
	echo "*-------------------------------------*"
	echo "Health: $hp"
	echo "Shields: $shield_hp"
	sleep 0.2
	echo "Attack:"
	sleep 0.1
	echo "  1: Laser Pulse"
	sleep 0.1
	if [ $plasma_cd -gt 0 ]
		then
		echo "  2: Plasma Cannon (Cooldown: $plasma_cd)"
	else
		echo "  2: Plasma Cannon"
	fi
	sleep 0.1
	echo "  3: Overheat Plasma Cannon"
	sleep 0.1
	echo "-----------------"
	sleep 0.1
	echo "Support:"
	sleep 0.1
	echo "  4: Dodge"
	sleep 0.1
	if [ $shield_cd -gt 0 ]
		then
		echo "  5: Shield (Cooldown: $shield_cd)"
	else
		echo "  5: Shield"
	fi
	sleep 0.1
	if [ $heal_cd -gt 0 ]
		then
		echo "  6: Repair (Cooldown $heal_cd)"
	else
		echo "  6: Repair"
	fi
	sleep 0.1
	echo "*-------------------------------------*"

	read choice

	if [ $choice -eq 1 ]; then
		echo "Firing Laser Pulse!"
		dmg=$((dmg+1))
	elif [ $choice -eq 2 ]; then
		if [ $plasma_cd -gt 0 ]
		then
			echo "Safety Protocols prohibt this action!"
		else
			echo "Charging Plasma Cannon!"
			plasma_charge=1
			plasma_cd=5
		fi
	elif [ $choice -eq 3 ]; then
		echo "Over-riding safety... Firing Plasma Cannon!"
		sleep 0.1 
		if [ $((1 + RANDOM % 3)) -eq 1 ]; then
			echo "The Plasma Cannon backfired!"
			hp=$(($hp-4))
			plasma_charge=-1
			plasma_cd=10
			overheat_cd=10
		else
			echo "Plasma Cannon Fired!"
			dmg=$((dmg+3))
			plasma_cd=5
			overheat_cd=2
		fi
	elif [ $choice -eq 4 ]; then
		echo "Taking Evasive Action!"
		avoid=2
	elif [ $choice -eq 5 ]; then
		if [ $shield_cd -gt 0 ]
		then
			echo "Energy insufficient to charge Shields."
		else
			echo "Shields are up!"
			shield_cd=5
			shield_hp=5
		fi
	elif [ $choice -eq 6 ]; then
		if [ $shield_cd -gt 0 ]
		then
			echo "The Reconstruction Nanobot Swarm is busy."
		else
			echo "Repairing..."
			heal_cd=5
			hp=$(($hp+2))
		fi
	else
		echo "|;[-=``"
		sleep 0.02
		echo "**ERROR**"
		sleep 0.02
		echo ";:12!*&T^o9h--=+_1~"
		sleep 0.02
		echo "-=01-93"
		sleep 0.01
		echo "sffg871@GHA__"
		sleep 0.02
		echo "**ERROR**"
		sleep 0.02
		echo "^%*(*!80XI"
		sleep 0.02
		echo "63994/0 [ERROR: -108!#&(*"
		echo "-=01-93"
		sleep 0.01
		echo "sffg871@GHA__"
		sleep 0.02
		echo "**ERROR**"
		sleep 0.01
		echo "**ERROR: Command not recognized! Taking no action.***"
	fi

	echo "$dmg damage dealt"
	if [ $isHost -eq 0 ]; then
		echo -ne $dmg >&3
		echo "Wait..."
		read <&3 atk
		
	fi

	if [ $atk -gt 0 ]; then

		if [ $avoid -eq 1 ]; then
			if [ $((1 + RANDOM % 3)) -eq 1 ]; then
				atk=0
				echo "You dodged the shot!"
			fi
		elif [ $avoid -eq 2 ]; then
			if [ $((1 + RANDOM % 2)) -eq 1 ]; then
				atk=0
				echo "You dodged the shot!"
			fi
		fi
		echo "You took $atk damage!"

		if [ $shield_hp -gt 0 ]; then
			shield_hp=$(($shield_hp-$atk))
			if [[ $shield_hp -lt 0 ]]; then
				hp=$(($hp-${shield_hp#-}))
				shield_hp=0
			fi
		else
			hp=$(($hp-$atk))
		fi
	elif [ $atk -eq -1 ]; then
		echo "Your enemy's ship has exploded! You win!"
		winState=1
	else
		echo "No shot was fired at you."
	fi


	sleep 1
	if [ $hp -lt 0 ]; then
		echo "Your ship has exploded!"
		winState=-1
		
	fi

done

if [ $isHost -eq 0 ]; then
	exec 3<&-
	exec 3>&-
fi