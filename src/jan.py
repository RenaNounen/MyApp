""" jan.py
ジャンケンを行うプログラム

"""

import argparse

class BaseHand:
    """BaseHand class
    全ての手の基本となるクラス

    Attributes:
        name(str): 手の名称
    """
    name = None

    def __init__(self, name=None):
        if name is not None:
            self.name = name

    def __eq__(self, other):
        if not isinstance(other, Item):
            return NotImplemented

        return self.name == other.name

    def __lt__(self, other):
        if not isinstance(other, BaseHand):
            return NotImplemented

        if self.name == "Gu" and other.name == "Pa":
            return True
        elif self.name == "Pa" and other.name == "Chi":
            return True
        elif self.name == "Chi" and other.name == "Gu":
            return True
        else:
            return False

    def __ge__(self, other):
        return not self.__lt__(other)

    def __str__(self):
        return self.name


class GuHand(BaseHand):
    """GuHand class
    グーのクラス

    """
    name = "Gu"


class ChiHand(BaseHand):
    """ChiHand class
    チョキのクラス

    """
    name = "Chi"


class PaHand(BaseHand):
    """PaHand class
    チョキのクラス

    """
    name = "Pa"


def fight(hand):
    """fight func
    ジャンケンの試合を実行

    Args:
        hand(str): ジャンケンの手

    """
    my_hand = GuHand()
    your_hand = BaseHand(name = hand)

    print("my hand is {}".format(my_hand))

    if my_hand < your_hand:
        print("you win")
    else:
        print("you lose")

if __name__ == "__main__":
    parser = argparse.ArgumentParser("ジャンケンをしよう！！")
    parser.add_argument('--hand', choices=['Pa', 'Gu', 'Chi'], required=True)
    args = parser.parse_args()

    fight(args.hand)
