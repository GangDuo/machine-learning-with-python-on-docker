import matplotlib.pyplot as plt

if __name__ == '__main__':
    labels = ['ひつじ', 'うし', 'とり', 'ぶた']
    x = list(range(1, len(labels) + 1))
    y = [0.5, 3, 5, 15]

    plt.bar(x, y, align='center')
    plt.xticks(x, labels, rotation='vertical')
    plt.xlabel('日本人一人あたりの消費量')
    plt.ylabel('消費量 (kg)')
    plt.tight_layout()
    plt.savefig('plot.png')
