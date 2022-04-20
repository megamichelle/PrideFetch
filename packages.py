from subprocess import check_output


def get_num_packages() -> (int, bool):
    try:
        return len(check_output(["pacman", "-Qq"]).decode("utf-8").split("\n")) - 1
    except FileNotFoundError:
        pass
    try:
        return len(check_output(["apt", "list", "--installed"]).decode("utf-8").split("\n")) - 1
    except FileNotFoundError:
        pass
    try:
        return len(check_output(["yum", "list", "installed"]).decode("utf-8").split("\n")) - 1
    except FileNotFoundError:
        pass
    try:
        return len(check_output(["dnf", "list", "installed"]).decode("utf-8").split("\n")) - 1
    except FileNotFoundError:
        pass
    try:
        return len(check_output(["qlist", "-I"]).decode("utf-8").split("\n")) - 1
    except FileNotFoundError:
        pass
    try:
        return len(check_output(["rpm", "-qa"]).decode("utf-8").split("\n")) - 1
    except FileNotFoundError:
        return False