#!/usr/bin/perl 
################################################################################
# create_category.pl
################################################################################

use strict;
use warnings;

package CreateCategory;

=head1 NAME

CreateCategory

=cut

use HTML::Template;
use FileHandle;
use Carp;

=head1 METHODS

=head2 new

Default constructor. Takes no arguments.

=cut

sub new
{
	my ($proto, %args) = @_;
	my $class = ref $proto || $proto;
	my $self = {};
	bless $self, $class;
	return $self;
}

=head2 work

Process arguments passed in to program, one at a time, creating a new category
page and a category line in the category file for each.

=cut

sub work
{
	my ($self, @args) = @_;

	for (@args)
	{
		my %templateVars = $self->_process_template_variables($_);
		my $category_page_contents = $self->_create_category_page(%templateVars);
		my $new_category_entry = $self->_update_category_list(%templateVars);

		$self->_write_category_page($_, $category_page_contents);
		$self->_insert_category($new_category_entry);
	}
}

# Insert new category in the categories file.

sub _insert_category
{
	my ($self, $new_category_entry) = @_;

	my $file_name = "_includes/category_list.inc";

	my @contents;

	## Read the current categories file.

	my $categories = new FileHandle($file_name, 'r') or croak "Couldn't open $file_name for reading $!";
	if (defined $categories)
	{
		@contents = $categories->getlines;
		$categories->close;
	}

	if (@contents)
	{
		my @new_contents;

		for (@contents)
		{
			if (/<!-- insert new category here -->/)
			{
				push @new_contents, $new_category_entry;
			}

			push @new_contents, $_;
		}

		my (@pre, @suf, @lines, $found);

		for (@new_contents)
		{
			my $cat = 1 if (/<!category>/);

			if (!$found and !$cat)
			{
				push @pre, $_;
			}
			elsif ($cat)
			{
				$found = 1;
				push @lines, $_;
			}
			else
			{
				push @suf, $_;
			}
		}

		@lines = sort @lines;

		my @sorted_content = (@pre, @lines, @suf);


		## Write the new categories file

		my $categories = new FileHandle($file_name, '>') or croak "Couldn't open $file_name for writing $!";

		if (defined $categories)
		{
			print $categories join '', @sorted_content;
			$categories->close();
		}
	}
}

# Write a new category file

sub _write_category_page
{
	my ($self, $name, $category_page_contents) = @_;

	my $file_name = "$name.html";

	my $category_file = new FileHandle($file_name, '>') or croak "Couldn't open $file_name for writing: $!";

	if (defined $category_file)
	{
		$category_file->print($category_page_contents);
		$category_file->close or croak "Couldn't close ${file_name}:$!";
	}
}

# Construct a nice structure for template

sub _process_template_variables
{
	my ($self, $name) = @_;

	(my $name_upper = $name) =~ s@^([a-z])(.*)@\u$1$2@;

	my %templateVars = (
		'name'       => $name,
		'name.upper' => $name_upper,
	);

	return %templateVars;
}

# Get the new category page contents

sub _create_category_page
{
	my ($self, %templateVars) = @_;

	my $template = new HTML::Template(
		'filename'          => 'category.tpl',
		'die_on_bad_params' => 0,
		'loop_context_vars' => 1,
	);

	$template->param(%templateVars);

	return $template->output;
}

# Write out new category list file

sub _update_category_list
{
	my ($self, %templateVars) = @_;

	my $template = new HTML::Template(
		'filename'          => 'category_line.tpl',
		'die_on_bad_params' => 0,
		'loop_context_vars' => 1,
	);

	$template->param(%templateVars);

	return $template->output;
}

=head2 print_usage

Print out to console a nice message about the usage.

=cut

sub print_usage
{
	my ($self) = @_;

	print << "FINI";

$0 [category-one] [categoey-two] ...

	This program will create a new category page and will include it in the
	category list. That file needs to be sorted afterwards.

FINI
}

package main;

sub main
{
	my $obj = new CreateCategory();

	if (!@ARGV)
	{
		$obj->print_usage;
	}
	else
	{
		$obj->work(@ARGV);
	}
}

main();
