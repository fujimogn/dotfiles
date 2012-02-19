" via http://d.hatena.ne.jp/joker1007/20111107/1320671775

hi def link rubyRailsTestMethod             Function
syn keyword rubyRailsTestMethod describe context it its specify shared_examples_for it_should_behave_like before after around subject fixtures controller_name helper_name
syn match rubyRailsTestMethod '\<let\>!\='
syn keyword rubyRailsTestMethod violated pending expect double mock mock_model stub_model
syn match rubyRailsTestMethod '\.\@<!\<stub\>!\@!'
