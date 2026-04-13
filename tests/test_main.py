from pytestqt.plugin import QtBot

from myapp.ui.main_window import MainWindow


def test_window_title(qtbot: QtBot) -> None:
    window = MainWindow()
    qtbot.addWidget(window)
    assert window.windowTitle() == "myapp"
