from subprocess import check_call

import pytest
import requests


@pytest.fixture
def authenticate():
    # @TODO: need to authenticate to the API here, this will depend on the actual solution
    pass


def test_loads_data_correctly():
    check_call(["make", "loaddata"])
    raise NotImplementedError("Run Makefile target and " "connect to postgres etc.")


def test_code_quality():
    raise NotImplementedError("Run pylint, mypy here and report fail/pass")


def test_top_10_search_terms_by_structure_value(authenticate):
    data = requests.get(
        "http://localhost:8000/api/v1/top_search_terms/?structure_value=foo"
    ).json()
    raise NotImplementedError(
        "Check that the data makes sense, aggregation was done etc."
    )


def test_top_10_search_terms_by_ad_group_alias():
    raise NotImplementedError(".")
