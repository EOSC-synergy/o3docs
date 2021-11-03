**********************
User documentation
**********************
O3as tutorial (online course)
-----------------------------

**Ttitle: O3AS Thematic Service**

**Description of the course**:

This course introduces you to ozone science: why ozone is important for
our everyday life, what is ozone assessment. We present then our O3as
service, how it can be used for simple analysis and a more advanced one.
In the advanced section we show the underlying software technologies we
are using.

1. Ozone introduction

   1. Role of ozone for our life

Ozone is a trace gas in the Earth’s atmosphere, that means that it only
occurs in very small quantities on Earth. Trace gases are gases that are
not nitrogen (78.1%), oxygen (20.9%) or argon (0.934%), i.e. they make
up only about 0.066% of the atmosphere (not including water which makes
up about 4%. If all the ozone were compressed to the pressure at the
Earth's surface (at 1013 hPa and 0°C) then the atmospheric content of
ozone would make up a layer of 3 mm (which is equivalent to 300 Dobson
Units (DU)) . The highest content of ozone is found in the stratosphere
at a height of about 25 to 30 km where the concentrations are about 10
parts per million parts of air (ppm), i.e. 0.001%.

The ozone present in the stratosphere at about 25 to 30 km is what makes
up most ozone in the atmosphere. This ozone is important for life on
planet Earth because it is responsible for removing most of the harmful
ultraviolet (UV) radiation from the sun. The longwave UV-A radiation
(about 315–400 nm) is not absorbed, medium range UV-B radiation (about
280–315 nm) is mostly absorbed and the most dangerous shortwave UV-C
radiation (about 100–280 nm) is totally absorbed by the ozone layer. A
decrease in the ozone layer increases the amount of UV-B radiation
reaching the Earth’s surface and the risk of skin cancer. Since UV
radiation not only has an effect of the health of human beings it also
has an effect on vegetation it is important to monitor stratospheric
ozone.

2. Ozone hole and ozone assessment

With support of the World Meteorological Organization (WMO), the United
Nations Environment Programme (UNEP), NASA, NOAA, and the European
Commission periodic `assessments of the state of
ozone <https://csl.noaa.gov/assessments/ozone/>`__ in the stratosphere
are produced. Monitoring and the assessment of stratospheric ozone was
started after the discovery of the ozone hole in the early eighties.
Realizing that the decline of stratospheric ozone was due to harmful
ozone destroying substances (ODSs) consisting of chlorofluorocarbons
(CFCs) and hydrochlorofluorocarbons (HCFCs) the Montreal protocol (1987)
and successor protocols were established to gradually curb the
production of ODSs. The first assessment of the state of ozone was
published in 1985, since 1994 they appear quadrennially.

3. Quiz (5 questions (?))

1. Why is stratospheric ozone important for life on Earth?

2. How much ozone is present in the Earth’s atmosphere?

3. What happened in the seventies that was discovered in the early
      eighties?

4. What was done to reduce the destruction of ozone?

5. What is done to publicize the state of ozone every four years?

   4. Ozone simulations and observations (e.g. CCMI, SBUV etc)

There is a huge effort to predict the future development of
stratospheric ozone under different scenarios. These scenarios are
modelled in different groups with different model setups/different
boundary/initial conditions. In order to get a robust prediction many
different model runs can be combined into ensembles. Model runs of total
ozone often don’t have same absolute values and are therefore normalized
using satellite observations of ozone data. A date can then be picked at
which the ozone of all the models agrees with the measured ozone. Only
then they can be compared. For a more robust prediction of the behaviour
of future ozone an average of all the model realizations can be produced
to make a multi model mean so that a more robust prediction can be made.

5. Total Column Ozone, zonal mean

The model results for the ozone data can come in different units, like
volume or mass mixing ratios, partial pressure, number densities or
ozone density. Those units can be converted into each other:

Conversions of ozone volume mixing ratio (vmr) into common other units:

The volume mixing ratio is given in ppmv (parts per million,
10\ :sup:`-6`,) pressure in hPa and temperature in K, then:

-  Ozone partial pressure pO\ :sub:`3` [nbar]:

..

   pO\ :sub:`3` = vmrO\ :sub:`3` × pressure

-  Ozone density ρO3[μg/m\ :sup:`3`]:

..

   ρO\ :sub:`3` = vmrO\ :sub:`3` × 577.3 × pressure / temperature

-  Ozone mass mixing ratio mO\ :sub:`3` [μg/g]:

..

   mO\ :sub:`3` = vmrO\ :sub:`3` × 1.66
   (mol_m_o:sub:`3`/mol_m_air=48/28.9)

-  Ozone number density NO\ :sub:`3` [molecules/cm:sup:`3`]:

..

   NO\ :sub:`3` = vmrO\ :sub:`3` × pressure / (1.38 × 10\ :sup:`-19` ×
   temperature)

Also all these units can be converted to ozone volume mixing ratio (vmr)
can be converted by inverting the above equations: The volume mixing
ratio is given in ppmv, pressure in hPa and temperature in K.

-  Ozone partial pressure pO\ :sub:`3` [nbar]:

..

   vmrO\ :sub:`3` = pO\ :sub:`3` / pressure

-  Ozone density ρO\ :sub:`3` [μg/m:sup:`3`]:

..

   vmrO\ :sub:`3` = ρO\ :sub:`3` × 1.7322 × 10\ :sup:`-3` × temperature
   / pressure

-  Ozone mass mixing ratio mO\ :sub:`3` [μg/g]:

..

   vmrO\ :sub:`3` = mO\ :sub:`3` × 0.602

-  Ozone number density NO3 [molecules/cm3]:

..

   vmrO3 = NO3 × 1.38 × 10\ :sup:`-19` × temperature / pressure

(http://www.meteo.mcgill.ca/hydroxyl/wiki/doku.php?id=ozone from Thilo
Erbertseder, Frank Baier, last modified: October 2005)

Once ozone number density values are calculated, the values can be
integrated over all heights to get a total column of ozone. Often the
integration is done only partially either over the heights in the
troposphere (from the ground to the tropopause) to get a tropospheric
partial column of ozone or over the heights of the stratosphere (from
the tropopause to the top of the atmosphere) to get a stratospheric
partial column. The unit most often used for the column values of ozone
is the Dobson unit:

-  1 Dobson Unit (DU) is:

..

   2.6867 × 10\ :sup:`+20` molecules per square meter

   4.4615 × 10\ :sup:`-04` mol per square meter

   2.1415 × 10\ :sup:`-05` kilogram of ozone per square meter

Also, a Dobson Unit can also be seen as a measurement of thickness of
the ozone column: A typical column amount of 300 DU of atmospheric ozone
corresponds to a 3 mm layer of pure gas at the surface of the Earth.

It can be seen that the integration over altitude in m could be done
over those other units (mol, kg) as well, instead of only the number
densities.

Often we deal with large data sets. Since we are interested mainly in
the latitudinal distribution of ozone zonally (E-W direction) averaged
values of ozone can be used.

Now we have reduced the 4 dimensional dataset (time, latitude, longitude
and altitude) into a two dimensional dataset (time, latitude) by first
integrating over the altitudes and then taking the zonal mean across the
longitudes. Of these values time series can be plotted to see the trend
in future ozone over different latitude bands.

6. Total Column Ozone, Return curves

As mentioned in the previous section, the time series of total column
ozone (zonally averaged) can be normalized using satellite observations
of ozone data. Usually a year before the decline of ozone in the 1980s
is used for the normalization. If the year 1980 is taken, then we use
the measurements of the ozone column and move all the model time series
up or down so that they pass through the point of measurement. Since
ozone has been decreasing from that point and has slowly recovered and
is rising again, we are able to check when in the future ozone will be
at the same level as in 1980 again. Having done this we can plot the
time of ozone returning to 1980 level for each model and for different
seasons/months/latitude bands.

7. Quiz (5-10 questions (?)

1. What is the difference between a total column and a partial column of
      ozone?

2. What is a Dobson Unit?

3. How do you get from a data field of volume mixing ratios (latitude,
      longitude, height) into a total column? What steps are necessary?

4. What is a zonal mean?

5. Why would one use a multi model mean?

6. What is ozone return?

7. How can models be compared that have totally different values
      (offsets) from each other?

2. O3as API for users

   1. o3api in a nutshell (what is an API, OpenAPI, how to access)

   2. Available endpoints, how to access the running API

   3. Lab: access the running API and perform a number of tasks via web
         browser (Swagger UI)

   4. Quiz: API info, available plot types, model info

   5. How to setup Jupyter notebook in learn.eosc-synergy.eu

   6. Lab: download Jupyter notebook, run it, retrieve info about the
         API

   7. Quiz: API info (?)

   8. Lab: request tco3_zm \*plot\* for certain models and latitudes,
         get plot data points, plot them in Jupyter Notebook

   9. | Quiz:
         | - what http request type one had to use to retrieve data
           points?

| - what is the default model for reference measurement?
| - when ozone level comes back to its reference value in this region?

10. Lab: retrieve original data points for the same region as in the
       previous Lab. Plot the row data. Using provided in the notebook
       functions, reproduce the plot from the previous Lab. ...

3. O3as for developers (advanced)

   1. O3as architecture: o3skim, o3api

   2. O3as: git organization, docker hub, documentation

   3. O3skim in a nutshell (?)

   4. Reading more: e.g. TDD

   5. O3api in a nutshell (?)

   6. Reading more: e.g. OpenAPI, Swagger

   7. Integrate your own app with the API (??)

4. Conclusion / Summary
