" Vim syntax file
" Language:   BlueConfig
" Maintainer: Matthias Wolf <m@sushinara.net>
" URL:        https://github.com/matz-e/vim-blueconfig

" TODO add "Note" field for Run
" TODO add "SynapseConfigure" field for Connection

if exists("b:current_syntax")
  finish
endif

syn match bcComment "#.*"
syn match bcComment "#.*" nextgroup=bcCommentBlock skipwhite skipnl
syn region bcCommentBlock start=+{+ end=+}+ contained

syn match bcNumber "\<-\?\d\+\(\.\d\+\)\?\>" contained
syn match bcNumber "\<\d\{1,2\}\(:\d\{1,2\}\)\{1,2\}\>" contained

syn keyword bcConfigureKeyword SynapseConfigure nextgroup=bcConfigureIdentifier skipwhite
syn match bcConfigureIdentifier display "\(%s.\)\?\w\+" contained nextgroup=bcConfigureOperator skipwhite
syn match bcConfigureOperator display "*\?=" contained nextgroup=bcConfigureNumber skipwhite
syn match bcConfigureNumber display "-\?\d\+\(.\d\+\)\?" contained nextgroup=bcConfigureIdentifier skipwhite
syn match bcIdentifier display "%s" containedin=bcConfigureIdentifier

syn match bcConfigureNumber "\<-\?\d\+\(\.\d\+\)\?\>" contained nextgroup=bcConfigureIdentifier skipwhite
syn match bcConfigureNumber "\<\d\{1,2\}\(:\d\{1,2\}\)\{1,2\}\>" contained nextgroup=bcConfigureIdentifier skipwhite

syn match bcPath "\(https\?://\|ssh://\)\?\([[:alpha:][:digit:][:punct:]]\+/\)*[[:alpha:][:digit:][:punct:]]\+" contained
syn match bcString "[[:alpha:][:digit:][:punct:]]\+" contained

syn keyword bcConnection Connection nextgroup=bcConnectionTarget skipwhite
syn match bcConnectionTarget "\%([^[:cntrl:][:space:][:punct:][:digit:]]\)\%([^[:cntrl:][:space:][:punct:]]\|_\|-\)*"
                        \ contained nextgroup=bcConnectionDefinition skipwhite skipnl
syn region bcConnectionDefinition start=+{+ end=+}+
                        \ transparent contained
                        \ contains=bcConfigureKeyword,bcConnectionNumberKeyword,bcConnectionPathKeyword,bcConnectionStringKeyword,bcComment

syn keyword bcConnectionNumberKeyword
                        \ Weight SpontMinis
                        \ contained nextgroup=bcNumber skipwhite
syn keyword bcConnectionPathKeyword
                        \ OtherSynPath
                        \ contained nextgroup=bcPath skipwhite
syn keyword bcConnectionStringKeyword
                        \ Source Destination ModOverride
                        \ contained nextgroup=bcString skipwhite

syn keyword bcRun Run nextgroup=bcRunTarget skipwhite
syn match bcRunTarget "\%([^[:cntrl:][:space:][:punct:][:digit:]]\)\%([^[:cntrl:][:space:][:punct:]]\|_\)*"
                        \ contained nextgroup=bcRunDefinition skipwhite skipnl
syn region bcRunDefinition start=+{+ end=+}+
                        \ transparent contained
                        \ contains=bcRunNumberKeyword,bcRunPathKeyword,bcRunStringKeyword,bcComment

syn keyword bcRunNumberKeyword
                        \ Date Time Version BaseSeed Duration Dt ForwardSkip
                        \ NumBonusFiles NumSynapseFiles
                        \ CentralHyperColumn
                        \ contained nextgroup=bcNumber skipwhite
syn keyword bcRunPathKeyword
                        \ gitPath svnPath MeshPath MorphologyPath METypePath CircuitPath
                        \ nrnPath ElectrodesPath CurrentDir OutputRoot
                        \ BonusSynapseFile
                        \ CellLibraryFile MEComboInfoFile TargetFile
                        \ Atlas BioName
                        \ SynapseMask
                        \ contained nextgroup=bcPath skipwhite
syn keyword bcRunStringKeyword
                        \ CircuitTarget RNGMode RunMode SimulatorMode Simulator
                        \ Version
                        \ contained nextgroup=bcString skipwhite

syn keyword bcProjection Projection nextgroup=bcProjectionTarget skipwhite
syn match bcProjectionTarget "\%([^[:cntrl:][:space:][:punct:][:digit:]]\)\%([^[:cntrl:][:space:][:punct:]]\|_\)*"
                        \ contained nextgroup=bcProjectionDefinition skipwhite skipnl
syn region bcProjectionDefinition start=+{+ end=+}+
                        \ transparent contained
                        \ contains=bcProjectionNumberKeyword,bcProjectionPathKeyword,bcProjectionStringKeyword,bcComment

syn keyword bcProjectionNumberKeyword
                        \ NumSynapseFiles
                        \ contained nextgroup=bcNumber skipwhite
syn keyword bcProjectionPathKeyword
                        \ Path
                        \ contained nextgroup=bcPath skipwhite
syn keyword bcProjectionStringKeyword
                        \ Type Source
                        \ contained nextgroup=bcString skipwhite


syn keyword bcReport Report nextgroup=bcReportTarget skipwhite
syn match bcReportTarget "\%([^[:cntrl:][:space:][:punct:][:digit:]]\)\%([^[:cntrl:][:space:][:punct:]]\|_\)*"
                        \ contained nextgroup=bcReportDefinition skipwhite skipnl
syn region bcReportDefinition start=+{+ end=+}+
                        \ transparent contained
                        \ contains=bcReportNumberKeyword,bcReportPathKeyword,bcReportStringKeyword,bcComment

syn keyword bcReportNumberKeyword
                        \ Dt StartTime EndTime
                        \ contained nextgroup=bcNumber skipwhite
" syn keyword bcReportPathKeyword
"                         \ svnPath MorphologyPath METypePath CircuitPath
"                         \ nrnPath ElectrodesPath CurrentDir OutputRoot
"                         \ CellLibraryFile MEComboInfoFile TargetFile
"                         \ contained nextgroup=bcPath skipwhite
syn keyword bcReportStringKeyword
                        \ Target Type ReportOn Unit Format
                        \ contained nextgroup=bcString skipwhite


syn keyword bcStimulus Stimulus nextgroup=bcStimulusTarget skipwhite
syn match bcStimulusTarget "\%([^[:cntrl:][:space:][:punct:][:digit:]]\)\%([^[:cntrl:][:space:][:punct:]]\|_\)*"
                        \ contained nextgroup=bcStimulusDefinition skipwhite skipnl
syn region bcStimulusDefinition start=+{+ end=+}+
                        \ transparent contained
                        \ contains=bcStimulusNumberKeyword,bcStimulusPathKeyword,bcStimulusStringKeyword,bcComment

syn keyword bcStimulusNumberKeyword
                        \ Delay Duration MeanPercent Variance
                        \ PercentStart PercentEnd
                        \ contained nextgroup=bcNumber skipwhite
syn keyword bcStimulusPathKeyword
                        \ SpikeFile
                        \ nrnPath ElectrodesPath CurrentDir OutputRoot TargetFile
                        \ contained nextgroup=bcPath skipwhite
syn keyword bcStimulusStringKeyword
                        \ Mode Pattern
                        \ contained nextgroup=bcString skipwhite

syn keyword bcStimulusInject StimulusInject nextgroup=bcStimulusInjectTarget skipwhite
syn match bcStimulusInjectTarget "\%([^[:cntrl:][:space:][:punct:][:digit:]]\)\%([^[:cntrl:][:space:][:punct:]]\|_\)*"
                        \ contained nextgroup=bcStimulusInjectDefinition skipwhite skipnl
syn region bcStimulusInjectDefinition start=+{+ end=+}+
                        \ transparent contained
                        \ contains=bcStimulusInjectNumberKeyword,bcStimulusInjectPathKeyword,bcStimulusInjectStringKeyword,bcComment

" syn keyword bcStimulusInjectNumberKeyword
"                         \ Delay Duration MeanPercent Variance
"                         \ contained nextgroup=bcNumber skipwhite
" syn keyword bcStimulusInjectPathKeyword
"                         \ SpikeFile
"                         \ nrnPath ElectrodesPath CurrentDir OutputRoot TargetFile
"                         \ contained nextgroup=bcPath skipwhite
syn keyword bcStimulusInjectStringKeyword
                        \ Stimulus Target
                        \ contained nextgroup=bcString skipwhite

let b:current_syntax = "blueconfig"

syn sync fromstart

hi def link bcComment Comment
hi def link bcCommentBlock Comment
hi def link bcNumber Number
hi def link bcPath Identifier
hi def link bcString String

hi def link bcConfigureKeyword Keyword
hi def link bcConfigureIdentifier Identifier
hi def link bcConfigureOperator Operator
hi def link bcConfigureNumber Number
hi def link bcIdentifier PreProc

hi def link bcConnection Keyword
hi def link bcConnectionTarget Identifier
hi def link bcConnectionNumberKeyword Keyword
hi def link bcConnectionPathKeyword Keyword
hi def link bcConnectionStringKeyword Keyword

hi def link bcProjection Keyword
hi def link bcProjectionTarget Identifier
hi def link bcProjectionNumberKeyword Keyword
hi def link bcProjectionPathKeyword Keyword
hi def link bcProjectionStringKeyword Keyword

hi def link bcReport Keyword
hi def link bcReportTarget Identifier
hi def link bcReportNumberKeyword Keyword
hi def link bcReportPathKeyword Keyword
hi def link bcReportStringKeyword Keyword

hi def link bcRun Keyword
hi def link bcRunTarget Identifier
hi def link bcRunNumberKeyword Keyword
hi def link bcRunPathKeyword Keyword
hi def link bcRunStringKeyword Keyword

hi def link bcStimulus Keyword
hi def link bcStimulusTarget Identifier
hi def link bcStimulusNumberKeyword Keyword
hi def link bcStimulusPathKeyword Keyword
hi def link bcStimulusStringKeyword Keyword

hi def link bcStimulusInject Keyword
hi def link bcStimulusInjectTarget Identifier
hi def link bcStimulusInjectNumberKeyword Keyword
hi def link bcStimulusInjectPathKeyword Keyword
hi def link bcStimulusInjectStringKeyword Keyword
