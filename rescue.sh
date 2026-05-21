#!/sbin/sh

MODULE_DIR="/data/adb/modules"

########################################
# Safety Check
########################################

if [ ! -d "$MODULE_DIR" ]; then
    clear

    echo ""
    echo "=================================="
    echo " DroidWin Module Rescue v1.0"
    echo "=================================="
    echo ""
    echo "ERROR:"
    echo "/data/adb/modules not found."
    echo ""
    echo "Please mount/decrypt Data first."
    echo ""
    echo "Press ENTER to exit..."
    read

    exit 1
fi

while true
do
    clear

    echo ""
    echo "=================================="
    echo " DroidWin Module Rescue v1.0"
    echo "=================================="
    echo ""
    echo "1. Disable Module"
    echo "2. Remove Module"
    echo "3. Disable All Modules"
    echo "4. View Installed Modules"
    echo "5. Reboot System"
    echo "6. Exit"
    echo ""

    echo -n "Select option: "
    read OPTION

    case "$OPTION" in

    ##################################################
    # Disable Module
    ##################################################

    1)
        clear

        COUNT=0

        echo ""
        echo "Installed Modules"
        echo "================="
        echo ""

        for MOD in "$MODULE_DIR"/*
        do
            [ ! -d "$MOD" ] && continue

            NAME=$(grep '^name=' "$MOD/module.prop" 2>/dev/null | cut -d= -f2)
            [ -z "$NAME" ] && NAME=$(basename "$MOD")

            FOLDER=$(basename "$MOD")

            COUNT=$((COUNT+1))

            eval "MODULE_$COUNT='$MOD'"

            echo "$COUNT. $NAME ($FOLDER)"
        done

        [ "$COUNT" -eq 0 ] && {
            echo ""
            echo "No modules found."
            echo ""
            echo "Press ENTER to continue..."
            read
            continue
        }

        echo ""
        echo -n "Select module: "
        read NUM

        TARGET=$(eval echo \$MODULE_$NUM)

        [ -z "$TARGET" ] && {
            echo ""
            echo "Invalid selection."
            echo ""
            echo "Press ENTER to continue..."
            read
            continue
        }

        echo ""
        echo "Selected:"
        echo "$(basename "$TARGET")"
        echo ""
        echo "1. Yes"
        echo "2. No"
        echo ""
        echo -n "Disable module? "

        read CONFIRM

        [ "$CONFIRM" != "1" ] && continue

        touch "$TARGET/disable"

        echo ""
        echo "Module disabled successfully."
        echo ""
        echo "Press ENTER to continue..."
        read
    ;;

    ##################################################
    # Remove Module
    ##################################################

    2)
        clear

        COUNT=0

        echo ""
        echo "Installed Modules"
        echo "================="
        echo ""

        for MOD in "$MODULE_DIR"/*
        do
            [ ! -d "$MOD" ] && continue

            NAME=$(grep '^name=' "$MOD/module.prop" 2>/dev/null | cut -d= -f2)
            [ -z "$NAME" ] && NAME=$(basename "$MOD")

            FOLDER=$(basename "$MOD")

            COUNT=$((COUNT+1))

            eval "MODULE_$COUNT='$MOD'"

            echo "$COUNT. $NAME ($FOLDER)"
        done

        [ "$COUNT" -eq 0 ] && {
            echo ""
            echo "No modules found."
            echo ""
            echo "Press ENTER to continue..."
            read
            continue
        }

        echo ""
        echo -n "Select module: "
        read NUM

        TARGET=$(eval echo \$MODULE_$NUM)

        [ -z "$TARGET" ] && {
            echo ""
            echo "Invalid selection."
            echo ""
            echo "Press ENTER to continue..."
            read
            continue
        }

        echo ""
        echo "Selected:"
        echo "$(basename "$TARGET")"
        echo ""
        echo "1. Yes"
        echo "2. No"
        echo ""
        echo -n "Remove module? "

        read CONFIRM

        [ "$CONFIRM" != "1" ] && continue

        touch "$TARGET/remove"

        echo ""
        echo "Module marked for removal."
        echo ""
        echo "Reboot Android to complete removal."
        echo ""
        echo "Press ENTER to continue..."
        read
    ;;

    ##################################################
    # Disable All Modules
    ##################################################

    3)
        clear

        echo ""
        echo "WARNING"
        echo ""
        echo "This will disable ALL installed modules."
        echo ""
        echo "1. Continue"
        echo "2. Cancel"
        echo ""

        echo -n "Choice: "
        read CONFIRM

        [ "$CONFIRM" != "1" ] && continue

        COUNT=0

        for MOD in "$MODULE_DIR"/*
        do
            [ ! -d "$MOD" ] && continue

            touch "$MOD/disable"

            COUNT=$((COUNT+1))
        done

        echo ""
        echo "$COUNT module(s) disabled."
        echo ""
        echo "Press ENTER to continue..."
        read
    ;;

    ##################################################
    # View Installed Modules
    ##################################################

    4)
        clear

        COUNT=0

        echo ""
        echo "Installed Modules"
        echo "================="
        echo ""

        for MOD in "$MODULE_DIR"/*
        do
            [ ! -d "$MOD" ] && continue

            NAME=$(grep '^name=' "$MOD/module.prop" 2>/dev/null | cut -d= -f2)
            [ -z "$NAME" ] && NAME=$(basename "$MOD")

            FOLDER=$(basename "$MOD")

            COUNT=$((COUNT+1))

            echo "$COUNT. $NAME ($FOLDER)"
        done

        echo ""
        echo "Total Modules: $COUNT"
        echo ""
        echo "Press ENTER to continue..."
        read
    ;;

    ##################################################
    # Reboot System
    ##################################################

    5)
        clear

        echo ""
        echo "Rebooting system..."
        sleep 2

        reboot
        exit
    ;;

    ##################################################
    # Exit
    ##################################################

    6)
        clear
        echo ""
        echo "Thank you for using"
        echo "DroidWin Module Rescue v1.0"
        echo ""
        exit
    ;;

    ##################################################
    # Invalid Input
    ##################################################

    *)
        echo ""
        echo "Invalid option."
        sleep 2
    ;;

    esac

done