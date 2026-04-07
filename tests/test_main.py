from myapp.main import main


def test_main(capsys: object) -> None:
    main()
    captured = capsys.readouterr()  # type: ignore[union-attr]
    assert captured.out == "Hello, world!\n"
