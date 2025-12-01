/**
* CodeQL library for dockerfile
          * Automatically generated from the tree-sitter grammar; do not edit
*/

import codeql.Locations as L

/** Holds if the database is an overlay. */
private predicate isOverlay() { databaseMetadata("isOverlay", "true") }

/** Holds if `loc` is in the `file` and is part of the overlay base database. */
private predicate discardableLocation(@file file, @location_default loc) { (not (isOverlay())) and (locations_default(loc, file, _, _, _, _)) }

/** Holds if `loc` should be discarded, because it is part of the overlay base and is in a file that was also extracted as part of the overlay database. */
private predicate discardLocation(@location_default loc) { exists(@file file, string path | files(file, path) | (discardableLocation(file, loc)) and (overlayChangedFiles(path))) }

module dockerfile { 
  /** The base class for all AST nodes */class AstNode extends @dockerfile_ast_node { 
  /** Gets a string representation of this element. */string toString() { result = this.getAPrimaryQlClass() }
  /** Gets the location of this element. */final L::Location getLocation() { dockerfile_ast_node_location(this, result) }
  /** Gets the parent of this element. */final AstNode getParent() { dockerfile_ast_node_parent(this, result, _) }
  /** Gets the index of this node among the children of its parent. */final int getParentIndex() { dockerfile_ast_node_parent(this, _, result) }
  /** Gets a field or child node of this node. */AstNode getAFieldOrChild() { none() }
  /** Gets the name of the primary QL class for this element. */string getAPrimaryQlClass() { result = "???" }
  /** Gets a comma-separated list of the names of the primary CodeQL classes to which this element belongs. */string getPrimaryQlClasses() { result = concat(this.getAPrimaryQlClass(), ",") }
}
  /** A token. */class Token extends @dockerfile_token, AstNode { 
  /** Gets the value of this token. */final string getValue() { dockerfile_tokeninfo(this, _, result) }
  /** Gets a string representation of this element. */final override string toString() { result = this.getValue() }
  /** Gets the name of the primary QL class for this element. */override string getAPrimaryQlClass() { result = "Token" }
}
  /** A reserved word. */class ReservedWord extends @dockerfile_reserved_word, Token { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "ReservedWord" }
}
  /** Gets the file containing the given `node`. */
private @file getNodeFile(@dockerfile_ast_node node) { exists(@location_default loc | dockerfile_ast_node_location(node, loc) | locations_default(loc, result, _, _, _, _)) }
  /** Holds if `node` is in the `file` and is part of the overlay base database. */private predicate discardableAstNode(@file file, @dockerfile_ast_node node) { (not (isOverlay())) and (file = getNodeFile(node)) }
  /** Holds if `node` should be discarded, because it is part of the overlay base and is in a file that was also extracted as part of the overlay database. */
private predicate discardAstNode(@dockerfile_ast_node node) { exists(@file file, string path | files(file, path) | (discardableAstNode(file, node)) and (overlayChangedFiles(path))) }
  /** A class representing `add_instruction` nodes. */class AddInstruction extends @dockerfile_add_instruction, AstNode { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "AddInstruction" }
  /** Gets the `i`th child of this node. */final AstNode getChild(int i) { dockerfile_add_instruction_child(this, i, result) }
  /** Gets a field or child node of this node. */final override AstNode getAFieldOrChild() { (dockerfile_add_instruction_child(this, _, result)) }
}
  /** A class representing `arg_instruction` nodes. */class ArgInstruction extends @dockerfile_arg_instruction, AstNode { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "ArgInstruction" }
  /** Gets the node corresponding to the field `default`. */final AstNode getDefault() { dockerfile_arg_instruction_default(this, result) }
  /** Gets the node corresponding to the field `name`. */final UnquotedString getName() { dockerfile_arg_instruction_def(this, result) }
  /** Gets a field or child node of this node. */final override AstNode getAFieldOrChild() { (dockerfile_arg_instruction_default(this, result)) or (dockerfile_arg_instruction_def(this, result)) }
}
  /** A class representing `cmd_instruction` nodes. */class CmdInstruction extends @dockerfile_cmd_instruction, AstNode { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "CmdInstruction" }
  /** Gets the child of this node. */final AstNode getChild() { dockerfile_cmd_instruction_def(this, result) }
  /** Gets a field or child node of this node. */final override AstNode getAFieldOrChild() { (dockerfile_cmd_instruction_def(this, result)) }
}
  /** A class representing `comment` tokens. */class Comment extends @dockerfile_token_comment, Token { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "Comment" }
}
  /** A class representing `copy_instruction` nodes. */class CopyInstruction extends @dockerfile_copy_instruction, AstNode { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "CopyInstruction" }
  /** Gets the `i`th child of this node. */final AstNode getChild(int i) { dockerfile_copy_instruction_child(this, i, result) }
  /** Gets a field or child node of this node. */final override AstNode getAFieldOrChild() { (dockerfile_copy_instruction_child(this, _, result)) }
}
  /** A class representing `cross_build_instruction` tokens. */class CrossBuildInstruction extends @dockerfile_token_cross_build_instruction, Token { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "CrossBuildInstruction" }
}
  /** A class representing `double_quoted_string` nodes. */class DoubleQuotedString extends @dockerfile_double_quoted_string, AstNode { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "DoubleQuotedString" }
  /** Gets the `i`th child of this node. */final AstNode getChild(int i) { dockerfile_double_quoted_string_child(this, i, result) }
  /** Gets a field or child node of this node. */final override AstNode getAFieldOrChild() { (dockerfile_double_quoted_string_child(this, _, result)) }
}
  /** A class representing `entrypoint_instruction` nodes. */class EntrypointInstruction extends @dockerfile_entrypoint_instruction, AstNode { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "EntrypointInstruction" }
  /** Gets the child of this node. */final AstNode getChild() { dockerfile_entrypoint_instruction_def(this, result) }
  /** Gets a field or child node of this node. */final override AstNode getAFieldOrChild() { (dockerfile_entrypoint_instruction_def(this, result)) }
}
  /** A class representing `env_instruction` nodes. */class EnvInstruction extends @dockerfile_env_instruction, AstNode { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "EnvInstruction" }
  /** Gets the `i`th child of this node. */final EnvPair getChild(int i) { dockerfile_env_instruction_child(this, i, result) }
  /** Gets a field or child node of this node. */final override AstNode getAFieldOrChild() { (dockerfile_env_instruction_child(this, _, result)) }
}
  /** A class representing `env_pair` nodes. */class EnvPair extends @dockerfile_env_pair, AstNode { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "EnvPair" }
  /** Gets the node corresponding to the field `name`. */final UnquotedString getName() { dockerfile_env_pair_def(this, result) }
  /** Gets the node corresponding to the field `value`. */final AstNode getValue() { dockerfile_env_pair_value(this, result) }
  /** Gets a field or child node of this node. */final override AstNode getAFieldOrChild() { (dockerfile_env_pair_def(this, result)) or (dockerfile_env_pair_value(this, result)) }
}
  /** A class representing `escape_sequence` tokens. */class EscapeSequence extends @dockerfile_token_escape_sequence, Token { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "EscapeSequence" }
}
  /** A class representing `expansion` nodes. */class Expansion extends @dockerfile_expansion, AstNode { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "Expansion" }
  /** Gets the child of this node. */final Variable getChild() { dockerfile_expansion_def(this, result) }
  /** Gets a field or child node of this node. */final override AstNode getAFieldOrChild() { (dockerfile_expansion_def(this, result)) }
}
  /** A class representing `expose_instruction` nodes. */class ExposeInstruction extends @dockerfile_expose_instruction, AstNode { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "ExposeInstruction" }
  /** Gets the `i`th child of this node. */final AstNode getChild(int i) { dockerfile_expose_instruction_child(this, i, result) }
  /** Gets a field or child node of this node. */final override AstNode getAFieldOrChild() { (dockerfile_expose_instruction_child(this, _, result)) }
}
  /** A class representing `expose_port` tokens. */class ExposePort extends @dockerfile_token_expose_port, Token { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "ExposePort" }
}
  /** A class representing `from_instruction` nodes. */class FromInstruction extends @dockerfile_from_instruction, AstNode { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "FromInstruction" }
  /** Gets the node corresponding to the field `as`. */final ImageAlias getAs() { dockerfile_from_instruction_as(this, result) }
  /** Gets the `i`th child of this node. */final AstNode getChild(int i) { dockerfile_from_instruction_child(this, i, result) }
  /** Gets a field or child node of this node. */final override AstNode getAFieldOrChild() { (dockerfile_from_instruction_as(this, result)) or (dockerfile_from_instruction_child(this, _, result)) }
}
  /** A class representing `healthcheck_instruction` nodes. */class HealthcheckInstruction extends @dockerfile_healthcheck_instruction, AstNode { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "HealthcheckInstruction" }
  /** Gets the `i`th child of this node. */final AstNode getChild(int i) { dockerfile_healthcheck_instruction_child(this, i, result) }
  /** Gets a field or child node of this node. */final override AstNode getAFieldOrChild() { (dockerfile_healthcheck_instruction_child(this, _, result)) }
}
  /** A class representing `heredoc_block` nodes. */class HeredocBlock extends @dockerfile_heredoc_block, AstNode { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "HeredocBlock" }
  /** Gets the `i`th child of this node. */final AstNode getChild(int i) { dockerfile_heredoc_block_child(this, i, result) }
  /** Gets a field or child node of this node. */final override AstNode getAFieldOrChild() { (dockerfile_heredoc_block_child(this, _, result)) }
}
  /** A class representing `heredoc_end` tokens. */class HeredocEnd extends @dockerfile_token_heredoc_end, Token { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "HeredocEnd" }
}
  /** A class representing `heredoc_line` tokens. */class HeredocLine extends @dockerfile_token_heredoc_line, Token { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "HeredocLine" }
}
  /** A class representing `heredoc_marker` tokens. */class HeredocMarker extends @dockerfile_token_heredoc_marker, Token { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "HeredocMarker" }
}
  /** A class representing `image_alias` nodes. */class ImageAlias extends @dockerfile_image_alias, AstNode { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "ImageAlias" }
  /** Gets the `i`th child of this node. */final Expansion getChild(int i) { dockerfile_image_alias_child(this, i, result) }
  /** Gets a field or child node of this node. */final override AstNode getAFieldOrChild() { (dockerfile_image_alias_child(this, _, result)) }
}
  /** A class representing `image_digest` nodes. */class ImageDigest extends @dockerfile_image_digest, AstNode { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "ImageDigest" }
  /** Gets the `i`th child of this node. */final Expansion getChild(int i) { dockerfile_image_digest_child(this, i, result) }
  /** Gets a field or child node of this node. */final override AstNode getAFieldOrChild() { (dockerfile_image_digest_child(this, _, result)) }
}
  /** A class representing `image_name` nodes. */class ImageName extends @dockerfile_image_name, AstNode { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "ImageName" }
  /** Gets the `i`th child of this node. */final Expansion getChild(int i) { dockerfile_image_name_child(this, i, result) }
  /** Gets a field or child node of this node. */final override AstNode getAFieldOrChild() { (dockerfile_image_name_child(this, _, result)) }
}
  /** A class representing `image_spec` nodes. */class ImageSpec extends @dockerfile_image_spec, AstNode { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "ImageSpec" }
  /** Gets the node corresponding to the field `digest`. */final ImageDigest getDigest() { dockerfile_image_spec_digest(this, result) }
  /** Gets the node corresponding to the field `name`. */final ImageName getName() { dockerfile_image_spec_def(this, result) }
  /** Gets the node corresponding to the field `tag`. */final ImageTag getTag() { dockerfile_image_spec_tag(this, result) }
  /** Gets a field or child node of this node. */final override AstNode getAFieldOrChild() { (dockerfile_image_spec_digest(this, result)) or (dockerfile_image_spec_def(this, result)) or (dockerfile_image_spec_tag(this, result)) }
}
  /** A class representing `image_tag` nodes. */class ImageTag extends @dockerfile_image_tag, AstNode { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "ImageTag" }
  /** Gets the `i`th child of this node. */final Expansion getChild(int i) { dockerfile_image_tag_child(this, i, result) }
  /** Gets a field or child node of this node. */final override AstNode getAFieldOrChild() { (dockerfile_image_tag_child(this, _, result)) }
}
  /** A class representing `json_string` nodes. */class JsonString extends @dockerfile_json_string, AstNode { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "JsonString" }
  /** Gets the `i`th child of this node. */final EscapeSequence getChild(int i) { dockerfile_json_string_child(this, i, result) }
  /** Gets a field or child node of this node. */final override AstNode getAFieldOrChild() { (dockerfile_json_string_child(this, _, result)) }
}
  /** A class representing `json_string_array` nodes. */class JsonStringArray extends @dockerfile_json_string_array, AstNode { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "JsonStringArray" }
  /** Gets the `i`th child of this node. */final JsonString getChild(int i) { dockerfile_json_string_array_child(this, i, result) }
  /** Gets a field or child node of this node. */final override AstNode getAFieldOrChild() { (dockerfile_json_string_array_child(this, _, result)) }
}
  /** A class representing `label_instruction` nodes. */class LabelInstruction extends @dockerfile_label_instruction, AstNode { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "LabelInstruction" }
  /** Gets the `i`th child of this node. */final LabelPair getChild(int i) { dockerfile_label_instruction_child(this, i, result) }
  /** Gets a field or child node of this node. */final override AstNode getAFieldOrChild() { (dockerfile_label_instruction_child(this, _, result)) }
}
  /** A class representing `label_pair` nodes. */class LabelPair extends @dockerfile_label_pair, AstNode { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "LabelPair" }
  /** Gets the node corresponding to the field `key`. */final AstNode getKey() { dockerfile_label_pair_def(this, result, _) }
  /** Gets the node corresponding to the field `value`. */final AstNode getValue() { dockerfile_label_pair_def(this, _, result) }
  /** Gets a field or child node of this node. */final override AstNode getAFieldOrChild() { (dockerfile_label_pair_def(this, result, _)) or (dockerfile_label_pair_def(this, _, result)) }
}
  /** A class representing `line_continuation` tokens. */class LineContinuation extends @dockerfile_token_line_continuation, Token { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "LineContinuation" }
}
  /** A class representing `maintainer_instruction` tokens. */class MaintainerInstruction extends @dockerfile_token_maintainer_instruction, Token { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "MaintainerInstruction" }
}
  /** A class representing `mount_param` nodes. */class MountParam extends @dockerfile_mount_param, AstNode { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "MountParam" }
  /** Gets the node corresponding to the field `name`. */final string getName() { exists(int value | dockerfile_mount_param_def(this, value) | ((result = "mount") and (value = 0))) }
  /** Gets the node corresponding to the field `value`. */final AstNode getValue(int i) { dockerfile_mount_param_value(this, i, result) }
  /** Gets a field or child node of this node. */final override AstNode getAFieldOrChild() { (dockerfile_mount_param_value(this, _, result)) }
}
  /** A class representing `mount_param_param` tokens. */class MountParamParam extends @dockerfile_token_mount_param_param, Token { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "MountParamParam" }
}
  /** A class representing `onbuild_instruction` nodes. */class OnbuildInstruction extends @dockerfile_onbuild_instruction, AstNode { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "OnbuildInstruction" }
  /** Gets the child of this node. */final AstNode getChild() { dockerfile_onbuild_instruction_def(this, result) }
  /** Gets a field or child node of this node. */final override AstNode getAFieldOrChild() { (dockerfile_onbuild_instruction_def(this, result)) }
}
  /** A class representing `param` tokens. */class Param extends @dockerfile_token_param, Token { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "Param" }
}
  /** A class representing `path` nodes. */class Path extends @dockerfile_path, AstNode { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "Path" }
  /** Gets the `i`th child of this node. */final AstNode getChild(int i) { dockerfile_path_child(this, i, result) }
  /** Gets a field or child node of this node. */final override AstNode getAFieldOrChild() { (dockerfile_path_child(this, _, result)) }
}
  /** A class representing `run_instruction` nodes. */class RunInstruction extends @dockerfile_run_instruction, AstNode { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "RunInstruction" }
  /** Gets the `i`th child of this node. */final AstNode getChild(int i) { dockerfile_run_instruction_child(this, i, result) }
  /** Gets a field or child node of this node. */final override AstNode getAFieldOrChild() { (dockerfile_run_instruction_child(this, _, result)) }
}
  /** A class representing `shell_command` nodes. */class ShellCommand extends @dockerfile_shell_command, AstNode { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "ShellCommand" }
  /** Gets the `i`th child of this node. */final AstNode getChild(int i) { dockerfile_shell_command_child(this, i, result) }
  /** Gets a field or child node of this node. */final override AstNode getAFieldOrChild() { (dockerfile_shell_command_child(this, _, result)) }
}
  /** A class representing `shell_fragment` nodes. */class ShellFragment extends @dockerfile_shell_fragment, AstNode { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "ShellFragment" }
  /** Gets the `i`th child of this node. */final HeredocMarker getChild(int i) { dockerfile_shell_fragment_child(this, i, result) }
  /** Gets a field or child node of this node. */final override AstNode getAFieldOrChild() { (dockerfile_shell_fragment_child(this, _, result)) }
}
  /** A class representing `shell_instruction` nodes. */class ShellInstruction extends @dockerfile_shell_instruction, AstNode { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "ShellInstruction" }
  /** Gets the child of this node. */final JsonStringArray getChild() { dockerfile_shell_instruction_def(this, result) }
  /** Gets a field or child node of this node. */final override AstNode getAFieldOrChild() { (dockerfile_shell_instruction_def(this, result)) }
}
  /** A class representing `single_quoted_string` nodes. */class SingleQuotedString extends @dockerfile_single_quoted_string, AstNode { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "SingleQuotedString" }
  /** Gets the `i`th child of this node. */final EscapeSequence getChild(int i) { dockerfile_single_quoted_string_child(this, i, result) }
  /** Gets a field or child node of this node. */final override AstNode getAFieldOrChild() { (dockerfile_single_quoted_string_child(this, _, result)) }
}
  /** A class representing `source_file` nodes. */class SourceFile extends @dockerfile_source_file, AstNode { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "SourceFile" }
  /** Gets the `i`th child of this node. */final AstNode getChild(int i) { dockerfile_source_file_child(this, i, result) }
  /** Gets a field or child node of this node. */final override AstNode getAFieldOrChild() { (dockerfile_source_file_child(this, _, result)) }
}
  /** A class representing `stopsignal_instruction` nodes. */class StopsignalInstruction extends @dockerfile_stopsignal_instruction, AstNode { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "StopsignalInstruction" }
  /** Gets the `i`th child of this node. */final Expansion getChild(int i) { dockerfile_stopsignal_instruction_child(this, i, result) }
  /** Gets a field or child node of this node. */final override AstNode getAFieldOrChild() { (dockerfile_stopsignal_instruction_child(this, _, result)) }
}
  /** A class representing `unquoted_string` nodes. */class UnquotedString extends @dockerfile_unquoted_string, AstNode { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "UnquotedString" }
  /** Gets the `i`th child of this node. */final Expansion getChild(int i) { dockerfile_unquoted_string_child(this, i, result) }
  /** Gets a field or child node of this node. */final override AstNode getAFieldOrChild() { (dockerfile_unquoted_string_child(this, _, result)) }
}
  /** A class representing `user_instruction` nodes. */class UserInstruction extends @dockerfile_user_instruction, AstNode { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "UserInstruction" }
  /** Gets the node corresponding to the field `group`. */final UnquotedString getGroup() { dockerfile_user_instruction_group(this, result) }
  /** Gets the node corresponding to the field `user`. */final UnquotedString getUser() { dockerfile_user_instruction_def(this, result) }
  /** Gets a field or child node of this node. */final override AstNode getAFieldOrChild() { (dockerfile_user_instruction_group(this, result)) or (dockerfile_user_instruction_def(this, result)) }
}
  /** A class representing `variable` tokens. */class Variable extends @dockerfile_token_variable, Token { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "Variable" }
}
  /** A class representing `volume_instruction` nodes. */class VolumeInstruction extends @dockerfile_volume_instruction, AstNode { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "VolumeInstruction" }
  /** Gets the `i`th child of this node. */final AstNode getChild(int i) { dockerfile_volume_instruction_child(this, i, result) }
  /** Gets a field or child node of this node. */final override AstNode getAFieldOrChild() { (dockerfile_volume_instruction_child(this, _, result)) }
}
  /** A class representing `workdir_instruction` nodes. */class WorkdirInstruction extends @dockerfile_workdir_instruction, AstNode { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "WorkdirInstruction" }
  /** Gets the child of this node. */final Path getChild() { dockerfile_workdir_instruction_def(this, result) }
  /** Gets a field or child node of this node. */final override AstNode getAFieldOrChild() { (dockerfile_workdir_instruction_def(this, result)) }
}
}

