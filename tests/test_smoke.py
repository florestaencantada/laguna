import pytest


def test_import_and_version() -> None:
    import arborea

    assert isinstance(arborea.__version__, str)
    assert len(arborea.__version__) >= 1


def test_cli_version(capsys: pytest.CaptureFixture[str]) -> None:
    from arborea.cli import main

    code = main(["--version"])
    captured = capsys.readouterr()
    assert code == 0
    assert captured.out.strip()
