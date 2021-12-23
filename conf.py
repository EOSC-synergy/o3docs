# Configuration file for the Sphinx documentation builder.
#
# This file only contains a selection of the most common options. For a full
# list see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

# -- Path setup --------------------------------------------------------------

# If extensions (or modules to document with autodoc) are in another directory,
# add these directories to sys.path here. If the directory is relative to the
# documentation root, use os.path.abspath to make it absolute, like shown here.
import os
import sys
sys.path.insert(0, os.path.abspath('./o3api'))
sys.path.insert(0, os.path.abspath('./o3skim'))


# -- Project information -----------------------------------------------------

project = u'O3as: Ozone assessment service'
copyright = u'2021, Karlsruhe Institute of Technology (KIT)'
author = u'B. Esteban, M. Hardt, T. Kerzenmacher, V. Kozlov (KIT)'


# -- General configuration ---------------------------------------------------

master_doc = 'index'

# Add any Sphinx extension module names here, as strings. They can be
# extensions coming with Sphinx (named 'sphinx.ext.*') or your custom
# ones.
extensions = [
    'sphinx.ext.autodoc',
    'sphinx.ext.doctest',
    'sphinx.ext.intersphinx',
    'sphinx.ext.ifconfig',
    'sphinx.ext.viewcode',
    'sphinx.ext.githubpages',
    'sphinx.ext.autosectionlabel',
    'sphinxcontrib.openapi'
]
autosectionlabel_prefix_document = True

# Add any paths that contain templates here, relative to this directory.
templates_path = ['_templates']

# List of patterns, relative to source directory, that match files and
# directories to ignore when looking for source files.
# This pattern also affects html_static_path and html_extra_path.
exclude_patterns = ['_build', 'Thumbs.db', '.DS_Store']


# -- Options for HTML output -------------------------------------------------

# The theme to use for HTML and HTML Help pages.  See the documentation for
# a list of builtin themes.
#
#html_theme = 'alabaster'
html_theme = 'sphinx_rtd_theme'

# Add any paths that contain custom static files (such as style sheets) here,
# relative to this directory. They are copied after the builtin static files,
# so a file named "default.css" will overwrite the builtin "default.css".
html_static_path = ['_static']

html_logo = '_static/images/o3as-logo.svg'

html_css_files = [
    'css/custom.css',
]

# A string of reStructuredText that will be included at the end of every source file that is read.
# Add substitutions here that should be available in every file
rst_epilog = """
.. |br| raw:: html

   <br/>

.. |contact-us| replace:: `contact us <mailto:o3as-support@lists.kit.edu>`__

.. |o3as-web-link| replace:: `https://o3as.data.kit.edu <https://o3as.data.kit.edu>`__

.. |o3api-swagger-link| replace:: `https://api.o3as.fedcloud.eu/api/v1/ui/ <https://api.o3as.fedcloud.eu/api/v1/ui/>`__

.. |o3api-gitlab| replace:: `o3api GitLab repository <https://git.scc.kit.edu/synergy.o3as/o3api>`__

"""
