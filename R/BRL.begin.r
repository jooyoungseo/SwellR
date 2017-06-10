#' BRL.begin
#' @title Generate and optimize a braille-embedded ready-to-print pdf file for swell form machine

#' @aliases BRL.begin
#' @keywords BRL.begin

#' @description  The first argument to this function must be a call to create a graph, such as a histogram. Instead of opening a new graphics device, the graph will be created in a pdf file, with all text being presented using  a braille font.

#' @export BRL.begin
#' @param file A character string giving the filename where the image is to be saved. The default file name is "tactile.pdf" if not given.
#' @param pt Numeric value specifying braille font size for a created file. Default is 11.
#' @param paper Character value setting paper size of output pdf file. Default is "special".
#' @param font Character value for font family. Available options include "BRL" for "BRAILLE1.ttf" (Braille Normal) and "SWL" for "Swell-Braille.ttf" (Swell Braille). Default is set to "BRL".

#' @details
#' *Note*: This function optimizes for both 11*11 and 11*8.5 swell touch papers. When printing a generated braille pdf, just remember two things:
#' 1. check "Fit" in the print dialog box (the shortcut key is ALT+F).
#' 2. Check "Landscape" in the print dialog box as well.
#' * For boxplot, you do not need to check the "Landscape," just leave it as a "Portray." However, please check the "Fit" all the time.

#' Information:
#' If you are not familiar with what swell form machine is, please refer to [this web site](http://www.americanthermoform.com/product/swell-form-graphics-ii-machine/).
#' A short Youtube video will help you to understand how this function can be employed in conjunction with Swell form machine: https://www.youtube.com/watch?v=ClI555l4Z1M

#' @return Nothing within the R session, but a pdf file will be created in the user's working directory.

#' @examples
#' BRL.begin()
#' hist(airquality$Ozone)
#' BRL.end()
#' # The braille ready-to-print pdf version will be created in your working directory. Print it out and run the swell touch paper through swell form heating machine.

#' @author JooYoung Seo

#Function starts
BRL.begin <-
function(file="tactile.pdf", pt=11, paper="special", font="BRL") {

# Body code Starts here
#Preparing braille font
sysfonts::font.add("BRL", system.file("fonts/BRAILLE1.ttf", package="SwellR"))
sysfonts::font.add("SWL", system.file("fonts/Swell-Braille.ttf", package="SwellR"))

#Generating Braille PDF
pdf(file, pointsize=pt, paper=paper)
showtext::showtext.begin()
#Optimizing graphic size
par(cex=1.2, cex.main=1.2, cex.lab=1.2, cex.axis=1.2, cex.sub=1.2, mar=c(5,5,3,2), pch=20, family=font)


# Body code ends
}
#Function Ends
