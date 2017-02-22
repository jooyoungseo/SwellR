#' swell
#' @title Generate and optimize a braille-embedded ready-to-print pdf file for swell form machine

#' @aliases swell
#' @keywords swell

#' @description  The first argument to this function must be a call to create a graph, such as a histogram. Instead of opening a new graphics device, the graph will be created in a pdf file, with all text being presented using  a braille font.

#' @export swell
#' @param x the call to create a graph
#' @param file A character string giving the filename where the image is to be saved. The default file name is "output.pdf" if not given.
#' @param lines a vector argument that is passed to lty. Specify this as c(1, 3) when two lines are necessary (e.g., ANOVA interaction plot); and c(1, 3, 5) for three lines required plots.

#' @details
#' *Note*: This function optimizes for both 11*11 and 11*8.5 swell touch papers. When printing a generated braille pdf, just remember two things:
#' 1. check "Fit" in the print dialog box (the shortcut key is ALT+F).
#' 2. Check "Landscape" in the print dialog box as well.
#' * For boxplot, you do not need to check the "Landscape," just leave it as a "Portray." However, please check the "Fit" all the time.

#' Information:
#' If you are not familiar with what swell form machine is, please refer to [this web site](http://www.americanthermoform.com/product/swell-form-graphics-ii-machine/).

#' @return Nothing within the R session, but a pdf file will be created in the user's working directory.


#' @examples
#' swell(hist(airquality$Ozone), "test.pdf")
#' # The braille ready-to-print pdf version will be created in your working directory. Print it out and run the swell touch paper through swell form heating machine.

#' @author JooYoung Seo



#Function starts
swell <-
function(x, file="output.pdf", lines=c(1)) {

# Body code Starts here
if (interactive()) {

	# For Windows Platform
	if (.Platform$OS.type == "windows") {
		message("Detected OS: Windows")
	# 64bit
		if (Sys.getenv("R_ARCH") == "/x64") {
			if (!file.exists("C:/Program Files/gs/gs9.20/bin/gswin64c.exe")) {
				message("Latest Ghost Script is not found: installing...")
				installr::install.URL("https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs920/gs920w64.exe", installer_option="/S")
			}
			Sys.setenv(R_GSCMD="C:/Program Files/gs/gs9.20/bin/gswin64c.exe")
		}
	# 32bit
		else if (Sys.getenv("R_ARCH") == "/i386") {
			if (!file.exists("C:/Program Files/gs/gs9.20/bin/gswin32c.exe")) {
				message("Latest Ghost Script is not found: installing...")
				installr::install.URL("https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs920/gs920w32.exe", installer_option="/S")
			}
			Sys.setenv(R_GSCMD="C:/Program Files/gs/gs9.20/bin/gswin32c.exe")
		}

#Core Code Starts here.
#Preparing braille font
if (!"Braille Normal" %in% extrafont::fonts()) {
extrafont::font_import(pattern = "BRAILLE1.ttf", paths=system.file("fonts", package="SwellR"), prompt=FALSE)
}

#Showing graphic
#extrafont::loadfonts(device = "win", quiet = TRUE)
#par(cex=1.2, cex.main=1.2, cex.lab=1.2, cex.axis=1.2, mar=c(5,5,3,2), col="black", pch=20, lty=lines, family = "Braille Normal")
#x
#Showing graphic code ends

#Generating Braille PDF
#Loading required fonts
extrafont::loadfonts(device = "pdf", quiet = TRUE)

cairo_pdf(filename=file)
#pdf(file)

#Optimizing graphic size
par(cex=1.2, cex.main=1.2, cex.lab=1.2, cex.axis=1.2, mar=c(5,5,3,2), col="black", pch=20, lty=lines, family = "Braille Normal")
x

#Closing R graphic window
dev.off()

# embed the font
extrafont::embed_fonts(file)
#PDF Generator Code Ends here.
	}

	# For other OS
	else {
		warning("It is still under developent.")
	}
}

else {
	warning("Use this function only under interactive mode.")
}
# Body code ends
}
#Function Ends
