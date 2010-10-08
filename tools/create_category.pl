#!/usr/bin/perl 
################################################################################
# create_category.pl
################################################################################

use strict;
use warnings;

package CreateCategory;

use HTML::Template;
use FileHandle;
use Carp;

sub new
{
	my ($proto, %args) = @_;
	my $class = ref $proto || $proto;
	my $self = {};
	bless $self, $class;
	return $self;
}

sub work
{
	my ($self, @args) = @_;

	for (@args)
	{
		my %templateVars = $self->create_vars($_);
		my $category_page_contents = $self->create_category_page(%templateVars);
		my $new_category_entry = $self->update_category_list(%templateVars);

		$self->write_category_page($_, $category_page_contents);
		$self->insert_category($new_category_entry);
	}
}

sub insert_category
{
	my ($self, $new_category_entry) = @_;

	my $file_name = "../_source/_includes/category_list.inc";

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

sub write_category_page
{
	my ($self, $name, $category_page_contents) = @_;

	my $file_name = "../_source/$name.html";

	my $category_file = new FileHandle($file_name, '>') or croak "Couldn't open $file_name for writing: $!";

	if (defined $category_file)
	{
		$category_file->print($category_page_contents);
		$category_file->close or croak "Couldn't close ${file_name}:$!";
	}
}

sub create_vars
{
	my ($self, $name) = @_;

	(my $name_upper = $name) =~ s@^([a-z])(.*)@\u$1$2@;

	my %templateVars = (
		'name'       => $name,
		'name.upper' => $name_upper,
	);

	return %templateVars;
}

sub create_category_page
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

sub update_category_list
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
