# SwellR
Converting an R graphical output into a braille ready-to-print pdf file for visually impaired R users optimized for Swell Form Machine

## Usage:
> source('swell.r') # importing this swell.r source file.
> swell(x, file) # x is graphic argument and file is filename string. Please refer to the example below:

## Example:
 - swell(airquality$Ozone, "test.pdf") # The default file name is "output.pdf" if not given.
 - The braille ready-to-print pdf version will be created in your working directory. Print it out and run the swell touch paper through swell form heating machine.

## Note: This function optimizes for both 11*11 and 11*8.5 swell touch papers. When printing a generated braille pdf, just remember two things:

1. check "Fit" in the print dialog box.
2. Check "Landscape" in the print dialog box as well.

 * For boxplot, you do not need to check the "Landscape," just leave it as a "Portray." However, please check the "Fit" all the time.

### Information:

  If you are not familiar with what swell form machine is, please refer to this web site: http://www.americanthermoform.com/product/swell-form-graphics-ii-machine/

  This function implemented a free braille font BRAILLE1.ttf retrieved from http://www.fontsaddict.com/download/braille-normal.ttf

  Other dependent R packages and scripts are: BrailleR, extrafont, and Ghost Script.
