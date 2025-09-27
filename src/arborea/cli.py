from __future__ import annotations

import argparse

from . import __version__


def main(argv: list[str] | None = None) -> int:
    """Arborea CLI entry point.

    Args:
        argv: Optional list of arguments, for testing.

    Returns:
        Process exit code (0 on success).
    """
    parser = argparse.ArgumentParser(prog="arborea", description="Arborea CLI")
    parser.add_argument("--version", action="store_true", help="Show version and exit")
    args = parser.parse_args(argv)

    if args.version:
        print(__version__)
        return 0

    parser.print_help()
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
