from myapp.ui.main_window import MainWindow


def test_window_title(qtbot: object) -> None:
    window = MainWindow()
    qtbot.addWidget(window)  # type: ignore[union-attr]
    assert window.windowTitle() == "myapp"
