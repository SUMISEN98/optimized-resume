#!/bin/bash

# compile.sh - Resume compilation script with error handling
# Author: SUMISEN98
# Description: Compiles LaTeX resume with automatic cleanup and error reporting

set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuration
RESUME_FILE="resume.tex"
OUTPUT_DIR="."
LOG_FILE="compile.log"

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Function to check prerequisites
check_prerequisites() {
    print_status "Checking prerequisites..."
    
    if ! command -v pdflatex &> /dev/null; then
        print_error "pdflatex not found. Please install a LaTeX distribution:"
        echo "  • Ubuntu/Debian: sudo apt-get install texlive-full"
        echo "  • macOS: brew install --cask mactex"
        echo "  • Windows: Download MiKTeX from https://miktex.org/"
        echo ""
        echo "Alternatively, use Overleaf online: https://www.overleaf.com"
        exit 1
    fi
    
    if [ ! -f "$RESUME_FILE" ]; then
        print_error "Resume file '$RESUME_FILE' not found!"
        exit 1
    fi
    
    print_success "Prerequisites check passed"
}

# Function to clean up auxiliary files
cleanup() {
    print_status "Cleaning up temporary files..."
    
    # Remove LaTeX auxiliary files
    rm -f *.aux *.log *.out *.fls *.fdb_latexmk *.synctex.gz *.nav *.snm *.toc *.vrb
    
    # Remove backup files
    rm -f *~ *.bak
    
    print_success "Cleanup completed"
}

# Function to compile the resume
compile_resume() {
    print_status "Compiling resume from $RESUME_FILE..."
    
    # First compilation
    print_status "First compilation pass..."
    if ! pdflatex -interaction=nonstopmode "$RESUME_FILE" > "$LOG_FILE" 2>&1; then
        print_error "First compilation failed. Check $LOG_FILE for details."
        cat "$LOG_FILE"
        exit 1
    fi
    
    # Second compilation (for proper cross-references)
    print_status "Second compilation pass..."
    if ! pdflatex -interaction=nonstopmode "$RESUME_FILE" >> "$LOG_FILE" 2>&1; then
        print_error "Second compilation failed. Check $LOG_FILE for details."
        cat "$LOG_FILE"
        exit 1
    fi
    
    # Check if PDF was generated
    PDF_FILE="${RESUME_FILE%.tex}.pdf"
    if [ -f "$PDF_FILE" ]; then
        print_success "Resume compiled successfully: $PDF_FILE"
        
        # Display file size
        FILE_SIZE=$(du -h "$PDF_FILE" | cut -f1)
        print_status "Generated PDF size: $FILE_SIZE"
        
        # Display page count (if pdfinfo is available)
        if command -v pdfinfo &> /dev/null; then
            PAGE_COUNT=$(pdfinfo "$PDF_FILE" 2>/dev/null | grep "Pages:" | awk '{print $2}')
            if [ -n "$PAGE_COUNT" ]; then
                print_status "Number of pages: $PAGE_COUNT"
            fi
        fi
    else
        print_error "PDF file was not generated!"
        exit 1
    fi
}

# Function to display help
show_help() {
    echo "Resume Compilation Script"
    echo ""
    echo "Usage: $0 [OPTIONS]"
    echo ""
    echo "Options:"
    echo "  -h, --help     Show this help message"
    echo "  -c, --clean    Clean up temporary files only (no compilation)"
    echo "  -v, --verbose  Show detailed compilation output"
    echo ""
    echo "Examples:"
    echo "  $0              # Compile resume"
    echo "  $0 --clean      # Clean temporary files"
    echo "  $0 --verbose    # Compile with verbose output"
}

# Parse command line arguments
VERBOSE=false
CLEAN_ONLY=false

while [[ $# -gt 0 ]]; do
    case $1 in
        -h|--help)
            show_help
            exit 0
            ;;
        -c|--clean)
            CLEAN_ONLY=true
            shift
            ;;
        -v|--verbose)
            VERBOSE=true
            shift
            ;;
        *)
            print_error "Unknown option: $1"
            show_help
            exit 1
            ;;
    esac
done

# Main execution
main() {
    print_status "Starting resume compilation process..."
    echo "================================================"
    
    # If clean-only mode, just cleanup and exit
    if [ "$CLEAN_ONLY" = true ]; then
        cleanup
        exit 0
    fi
    
    # Check prerequisites
    check_prerequisites
    
    # Clean up before compilation
    cleanup
    
    # Compile the resume
    compile_resume
    
    # Clean up after compilation (keep PDF)
    cleanup
    
    echo "================================================"
    print_success "Resume compilation completed successfully!"
    print_status "Your resume is ready: ${RESUME_FILE%.tex}.pdf"
    
    # Optional: Open PDF if on macOS or Linux with display
    if [[ "$OSTYPE" == "darwin"* ]]; then
        print_status "Opening PDF with default viewer..."
        open "${RESUME_FILE%.tex}.pdf" 2>/dev/null || true
    elif command -v xdg-open &> /dev/null; then
        print_status "Opening PDF with default viewer..."
        xdg-open "${RESUME_FILE%.tex}.pdf" 2>/dev/null || true
    fi
}

# Trap to ensure cleanup on script exit
trap cleanup EXIT

# Run main function
main "$@"