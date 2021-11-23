
# Install and run Mypy

- Install Mypy.
    - Install directly.
        ```sh
        $ pip install mypy
        ```
    - Or install from requirements (make sure to add `mypy` to your file first).
        ```sh
        $ pip install -r requirements-dev.txt
        ```
- Run Mypy.
    - All.
        ```sh
        $ mypy .
        Success: no issues found in 4 source files
        ```
    - Targeted
        ```sh
        $ mypy my_app tests
        Success: no issues found in 4 source files
        ```
