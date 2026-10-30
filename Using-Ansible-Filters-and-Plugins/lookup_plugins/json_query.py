#!/usr/bin/env python3

from ansible.plugins.lookup import LookupBase
from ansible.errors import AnsibleError
import json


class LookupModule(LookupBase):
    """
    Custom lookup plugin to read JSON data from local files
    """

    def run(self, terms, variables=None, **kwargs):
        results = []

        for term in terms:
            try:
                with open(term, 'r') as f:
                    data = json.load(f)
                results.append(data)
            except json.JSONDecodeError as e:
                raise AnsibleError(f"Invalid JSON in {term}: {str(e)}")
            except FileNotFoundError:
                raise AnsibleError(f"File not found: {term}")
            except Exception as e:
                raise AnsibleError(f"Unexpected error: {str(e)}")

        return results
