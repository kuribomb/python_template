from PySide6.QtCore import Qt
from PySide6.QtWidgets import QLabel, QMainWindow, QVBoxLayout, QWidget


class MainWindow(QMainWindow):
    def __init__(self) -> None:
        super().__init__()
        self.setWindowTitle("myapp")
        self.setMinimumSize(640, 480)

        label = QLabel("Hello, world!")
        label.setAlignment(Qt.AlignmentFlag.AlignCenter)

        container = QWidget()
        layout = QVBoxLayout(container)
        layout.addWidget(label)

        self.setCentralWidget(container)
