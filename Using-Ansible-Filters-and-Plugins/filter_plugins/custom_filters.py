#!/usr/bin/env python3

import re


def reverse_string(text):
    """Reverse a string"""
    return str(text)[::-1]


def extract_numbers(text):
    """Extract all numbers from a string"""
    return re.findall(r'\d+', str(text))


def calculate_percentage(value, total):
    """Calculate percentage"""
    try:
        return round((float(value) / float(total)) * 100, 2)
    except (ValueError, ZeroDivisionError):
        return 0


def format_bytes(bytes_value):
    """Convert bytes to human readable format"""
    try:
        bytes_value = float(bytes_value)
        for unit in ['B', 'KB', 'MB', 'GB', 'TB']:
            if bytes_value < 1024.0:
                return f"{bytes_value:.2f} {unit}"
            bytes_value /= 1024.0
        return f"{bytes_value:.2f} PB"
    except (ValueError, TypeError):
        return "0 B"


class FilterModule(object):
    """Custom Ansible filters"""

    def filters(self):
        return {
            'reverse_string': reverse_string,
            'extract_numbers': extract_numbers,
            'calculate_percentage': calculate_percentage,
            'format_bytes': format_bytes,
        }
