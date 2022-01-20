How to use API (command line)
==============================

.. contents::
   :local:


Introduction
--------------
This HowTo demonstrates basic communication with the :doc:`O3as API <../o3api/docs/source/index>` by using `cURL <https://curl.se/>`__ tool.
Though cURL is a command-line tool, `libcurl <https://curl.se/libcurl/>`__ library is implemented in many programming languages (e.g. `pycurl <http://pycurl.io/>`__ for Python).
The examples below could also help understanding how the API calls can be implemented in your program using other means (e.g. `urllib <https://docs.python.org/3/library/urllib.html>`__ in Python).

.. note::
   :doc:`O3as API <../o3api/docs/source/index>` is based on the `Open API 3 and Swagger <https://swagger.io/>`__, which provides `Swagger UI <https://swagger.io/tools/swagger-ui/>`__, 
   visual documentation allowing to interact with the API in a friendly way via web. The O3AS API Swagger UI webpage is accessible at |o3api-swagger-link|.

.. tip::   

   For the complete description of the REST API, please, check :doc:`../o3api/docs/source/apiendpoints` and |o3api-swagger-link|. 

Info about available models
-------------------------------

Get list of all available models
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
.. code-block:: bash
   :substitutions:

   curl -X 'GET' '|o3api-v1-link|models' -H 'accept: application/json'

List models with a certain pattern
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
e.g select models with 'refC2' in the name:

.. code-block:: bash
   :substitutions:

   curl -X 'GET' \
   '|o3api-v1-link|models?select=refc2' \
   -H 'accept: application/json'
   
Get information about a particular model
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

e.g. about CCMI-1_ACCESS_ACCESS-CCM-refC2:

.. code-block:: bash
   :substitutions:

   curl -X 'GET' \
   '|o3api-v1-link|models/CCMI-1_ACCESS_ACCESS-CCM-refC2' \
   -H 'accept: application/json'
   
Get default plot styles of selected models 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
e.g for ``CCMI-1_ACCESS_ACCESS-CCM-refC2``, ``CCMI-1_CCCma_CMAM-refC2``, ``CCMI-1_CHASER-MIROC-ESM-refC2``

.. code-block:: bash
   :substitutions:

   curl -X 'POST' \
     '|o3api-v1-link|models/plotstyle' \
     -H 'accept: application/json' \
     -H 'Content-Type: application/json' \
     -d '[
     "CCMI-1_ACCESS_ACCESS-CCM-refC2",
     "CCMI-1_CCCma_CMAM-refC2",
     "CCMI-1_CHASER-MIROC-ESM-refC2"
   ]'


   
Creating plots
----------------

Get list of possible plots
~~~~~~~~~~~~~~~~~~~~~~~~~~~
.. code-block:: bash
   :substitutions:

   curl -X 'GET' \
     '|o3api-v1-link|plots' \
     -H 'accept: application/json'

Create tco3_zm plot 
~~~~~~~~~~~~~~~~~~~~
This example shows how to retrieve a :doc:`total column ozone (zonal mean) <../ozonescience/tco3_zm>` figure either in PDF or JSON format.
The query parameters used in the example are shown in the table below.

.. tip::
   For the explanation of parameters, please, check `O3API Endpoints <../o3api/docs/source/apiendpoints.html#post--plots-tco3_zm>`__

.. table:: Table: Query parameters to create a tco3_zm plot (in bold are required parameters)

   +-------------------------------+----------------------------+
   | Query parameter               |           Value            |
   +===============================+============================+
   | begin                         |            1959            |
   +-------------------------------+----------------------------+
   | end                           |            2100            |
   +-------------------------------+----------------------------+
   | month                         |          [9,10,11]         |
   +-------------------------------+----------------------------+
   | lat_min                       |            -90             |
   +-------------------------------+----------------------------+
   | lat_max                       |             90             |
   +-------------------------------+----------------------------+
   | **ref_meas**                  | SBUV_GSFC_merged-SAT-ozone |
   +-------------------------------+----------------------------+
   | **ref_year**                  |            1980            |
   +-------------------------------+----------------------------+
   | **Request body**              |                            |
   | (for the list of models)      |     e.g. all refC2 models  |
   +-------------------------------+----------------------------+

Example for PDF (``tco3_zm.pdf`` is created)
"""""""""""""""""""""""""""""""""""""""""""""
.. code-block:: bash
   :substitutions:

   curl -o tco3_zm.pdf -X 'POST' \
     '|o3api-v1-link|plots/tco3_zm?begin=1959&end=2100&month=9,10,11&lat_min=-90&lat_max=90&ref_meas=SBUV_GSFC_merged-SAT-ozone&ref_year=1980' \
     -H 'accept: application/pdf' \
     -H 'Content-Type: application/json' \
     -d |o3-models-refc2|

Example for JSON (``tco3_zm.json`` is created)
"""""""""""""""""""""""""""""""""""""""""""""""
.. code-block:: bash
   :substitutions:

   curl -o tco3_zm.json -X 'POST' \
     '|o3api-v1-link|plots/tco3_zm?begin=1959&end=2100&month=9,10,11&lat_min=-90&lat_max=90&ref_meas=SBUV_GSFC_merged-SAT-ozone&ref_year=1980' \
     -H 'accept: application/json' \
     -H 'Content-Type: application/json' \
     -d |o3-models-refc2|


Create tco3_return plot 
~~~~~~~~~~~~~~~~~~~~~~~~~
The example shows how to retrieve a :doc:`total column ozone (return years) <../ozonescience/tco3_return>` figure either in PDF or JSON format.
The query parameters used in the example are shown in the table below.

.. tip::
   For the explanation of parameters, please, check `O3API Endpoints <../o3api/docs/source/apiendpoints.html#post--plots-tco3_return>`__

.. table:: Table: Query parameters to create a tco3_return plot (in bold are required parameters)

   +-------------------------------+----------------------------+
   | Query parameter               |           Value            |
   +===============================+============================+
   | month                         |          [9,10,11]         |
   +-------------------------------+----------------------------+
   | lat_min                       |            -90             |
   +-------------------------------+----------------------------+
   | lat_max                       |             90             |
   +-------------------------------+----------------------------+
   | **ref_meas**                  | SBUV_GSFC_merged-SAT-ozone |
   +-------------------------------+----------------------------+
   | **ref_year**                  |            1980            |
   +-------------------------------+----------------------------+
   | **Request body**              |                            |
   | (for the list of models)      |     e.g. all refC2 models  |
   +-------------------------------+----------------------------+

Example for PDF (``tco3_return.pdf`` is created)
"""""""""""""""""""""""""""""""""""""""""""""""""
.. code-block:: bash
   :substitutions:

   curl  -o tco3_return.pdf -X 'POST' \
     '|o3api-v1-link|plots/tco3_return?month=9,10,11&lat_min=-90&lat_max=90&ref_meas=SBUV_GSFC_merged-SAT-ozone&ref_year=1980' \
     -H 'accept: application/pdf' \
     -H 'Content-Type: application/json' \
     -d |o3-models-refc2|
   
Example for JSON (``tco3_return.json`` is created)
""""""""""""""""""""""""""""""""""""""""""""""""""""
.. code-block:: bash
   :substitutions:

   curl  -o tco3_return.json -X 'POST' \
     '|o3api-v1-link|plots/tco3_return?month=9,10,11&lat_min=-90&lat_max=90&ref_meas=SBUV_GSFC_merged-SAT-ozone&ref_year=1980' \
     -H 'accept: application/json' \
     -H 'Content-Type: application/json' \
     -d |o3-models-refc2|


Info on skimmed data
----------------------
:doc:`o3skim <../o3skim/docs/index>` component produces skimmed data which are further processed by the :doc:`o3api <../o3api/docs/source/index>` 
to build plots for the Ozone assessment (e.g. :doc:`total column ozone (zonal mean) <../ozonescience/tco3_zm>` 
and :doc:`total column ozone (return years) <../ozonescience/tco3_return>`).

Get list of plot types with the available skimmed data
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: bash
   :substitutions:

   curl -X 'GET' '|o3api-v1-link|data' -H 'accept: application/json'
   
Get skimmed data used to build tco3_zm plot
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
.. tip::
   For the explanation of parameters, please, check `O3API Endpoints <../o3api/docs/source/apiendpoints.html#post--data-tco3_zm>`__

.. table:: Table: Query parameters for retrieving skimmed data used to build a tco3_zm plot (in bold are required parameters)

   +-------------------------------+----------------------------+
   | Query parameter               |           Value            |
   +===============================+============================+
   | begin                         |            1959            |
   +-------------------------------+----------------------------+
   | end                           |            2100            |
   +-------------------------------+----------------------------+
   | month                         |          [9,10,11]         |
   +-------------------------------+----------------------------+
   | lat_min                       |            -90             |
   +-------------------------------+----------------------------+
   | lat_max                       |             90             |
   +-------------------------------+----------------------------+
   | **Request body**              |                            |
   | (for the list of models)      |     e.g. all refC2 models  |
   +-------------------------------+----------------------------+


``tco3_zm_skimmed.json`` is created:

.. code-block:: bash
   :substitutions:

   curl -o tco3_zm_skimmed.json -X 'POST' \
     '|o3api-v1-link|data/tco3_zm?begin=1959&end=2100&month=9,10,11&lat_min=-90&lat_max=90' \
     -H 'accept: application/json' \
     -H 'Content-Type: application/json' \
     -d |o3-models-refc2|
   
Get skimmed data used to build tco3_return plot
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
.. tip::
   For the explanation of parameters, please, check `O3API Endpoints <../o3api/docs/source/apiendpoints.html#post--data-tco3_return>`__

.. table:: Table: Query parameters for retrieving skimmed data used to build a tco3_return plot (in bold are required parameters)

   +-------------------------------+----------------------------+
   | Query parameter               |           Value            |
   +===============================+============================+
   | begin                         |            1959            |
   +-------------------------------+----------------------------+
   | end                           |            2100            |
   +-------------------------------+----------------------------+
   | month                         |          [9,10,11]         |
   +-------------------------------+----------------------------+
   | lat_min                       |            -90             |
   +-------------------------------+----------------------------+
   | lat_max                       |             90             |
   +-------------------------------+----------------------------+
   | **Request body**              |                            |
   | (for the list of models)      |     e.g. all refC2 models  |
   +-------------------------------+----------------------------+


``tco3_return_skimmed.json`` is created:

.. code-block:: bash
   :substitutions:

   curl -o tco3_return_skimmed.json -X 'POST' \
     '|o3api-v1-link|data/tco3_return?begin=1959&end=2100&month=9,10,11&lat_min=-90&lat_max=90' \
     -H 'accept: application/json' \
     -H 'Content-Type: application/json' \
     -d |o3-models-refc2|

