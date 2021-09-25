from typing import Any

def unescape(string): ...
def denormalize(string): ...

class PoFileError(Exception):
    catalog: Any
    line: Any
    lineno: Any
    def __init__(self, message, catalog, line, lineno) -> None: ...

class _NormalizedString:
    def __init__(self, *args) -> None: ...
    def append(self, s) -> None: ...
    def denormalize(self): ...
    def __nonzero__(self): ...
    __bool__: Any
    def __cmp__(self, other): ...
    def __gt__(self, other): ...
    def __lt__(self, other): ...
    def __ge__(self, other): ...
    def __le__(self, other): ...
    def __eq__(self, other): ...
    def __ne__(self, other): ...

class PoFileParser:
    catalog: Any
    ignore_obsolete: Any
    counter: int
    offset: int
    abort_invalid: Any
    def __init__(self, catalog, ignore_obsolete: bool = ..., abort_invalid: bool = ...) -> None: ...
    def parse(self, fileobj) -> None: ...

def read_po(
    fileobj,
    locale: Any | None = ...,
    domain: Any | None = ...,
    ignore_obsolete: bool = ...,
    charset: Any | None = ...,
    abort_invalid: bool = ...,
): ...

WORD_SEP: Any

def escape(string): ...
def normalize(string, prefix: str = ..., width: int = ...): ...
def write_po(
    fileobj,
    catalog,
    width: int = ...,
    no_location: bool = ...,
    omit_header: bool = ...,
    sort_output: bool = ...,
    sort_by_file: bool = ...,
    ignore_obsolete: bool = ...,
    include_previous: bool = ...,
    include_lineno: bool = ...,
): ...
