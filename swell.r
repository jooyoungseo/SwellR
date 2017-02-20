#Swell function developed by JooYoung Seo.

#Saving font names into variables for convenience
BN = "Braille Normal"
SB = "Swell Braille"
AR = "Arial"

#Line Types here
single = c(1)
two = c(1, 3)
three = c(1, 3, 5)

#Function starts
swell <-
function(x, file="output.pdf", lines=c(1)) {

# Install required packages Block starts
chooseCRANmirror(ind=2)

# installr package
if (!require(installr)) {
	install.packages("installr", dependencies=TRUE)
}

# BrailleR package
if (!require(BrailleR)) {
	install.packages('BrailleR')
}

# extrafont package
if(!require(extrafont)) {
install.packages("extrafont", dependencies=T); require(extrafont)
}

# Cairo package
#if(!require(Cairo)) {
#install.packages("Cairo", dependencies=T); require(Cairo)
#}
#Required package block ends

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
#Checking required Braille Font
if (!dir.exists('fonts')) {
	dir.create('fonts')
}

#Downloading font if necessary
#if (!file.exists("fonts/BRAILLE1.ttf")) {
#	download.file("http://www.fontsaddict.com/download/braille-normal.ttf", "fonts/BRAILLE1.ttf")
#}

#Preparing PDF with braille font
font_import(pattern = "BRAILLE1.ttf", paths=system.file("fonts", package="BrailleR"), prompt=FALSE)
#font_import(pattern = "Swell-Braille.ttf", paths="fonts", prompt=FALSE)


#Showing graphic
#windowsFonts(A=windowsFont("Braille Normal"))
#X11()
#window(x, family=A)
#Showing graphic code ends

#Loading required fonts
extrafont::loadfonts(device = "pdf", quiet = TRUE)

#cairo_pdf(filename=file)
pdf(file)

#Optimizing graphic size
par(cex=1.2, cex.main=1.2, cex.lab=1.2, cex.axis=1.2, mar=c(5,5,3,2), col="black", pch=20, lty=lines,
family = 
#"Swell Braille"
"Braille Normal"
)

#Graphic code below:

sink("description.txt")
#source("graphic.r")
BrailleR::VI(x)
sink()
sink("warnings.txt")
warnings()
sink()

#Closing R graphic window
dev.off()

# embed the font
extrafont::embed_fonts(file)


#embed_fonts("Tactile%03d.pdf")

#Code Ends here.
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
