class addlib(object):
    def __init__(self, member=None):
        self.members = [member] if member else []

    def add_member(self, name):
        self.members.append(name)
        return self.members
